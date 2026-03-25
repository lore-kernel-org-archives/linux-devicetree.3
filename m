Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0D63B2FC6
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436695; cv=none; b=roChQA+dKcSEiaHBJU6YXjOFKRQGKq7qagUygP6D8Orc3qpsg6btaSvFtEDsoMKKLAQmV6g3hbnxt49yVHa5q+4JenGYY+c9gEDN67q9Y9Vdn1SO4YEql5qlVaDbzXMCG7gmmnp6flOV6cfd8Wg1bMB3n2grYbCe143Whry9WK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436695; c=relaxed/simple;
	bh=UiQfDSkXFnK+USypmoJ0iuMw3MTgsXcYxDNg1yOKe7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M5wITutjy3FH9pQttIHTY19Yz5R3zduNrQrlLIsDiSNuGi/tFq8uIDCDAOoqebx2vWoVBNEx5LrF6QnighyyipPivly+Cx8zft3aUtCZ87QkOu2c1j1Yk6CKWmwHJAV9ge/ct59pYfAmr4NljZyDbaDQPSvJm+u5whLqB0OVIeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nq//joma; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hhQs+m2Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nq//joma";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hhQs+m2Q"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PAQSIN2884698
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:04:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8G6G4aosQtrA9tx+ufEAxzAUa9Gs2oXeFM26jYouehQ=; b=nq//jomaRWRwzRHr
	Nw/8mxCTAfdnJ5xRnavfYTNVqwh5RNGwdNGE1zXtycLO8DY0kkOVSAsupxue0hxD
	bVreJfnIZ2eEey4WS2QAisFIae2x7weRRtdztlqvZ4fRKT8HPbIlkfkGPqQzxE6M
	vqpciQPm4lpSMezpE+7vOovVgAMPqBlhZU5inYi9pfNIV6wqdhldo9yBp1R4vptF
	XfbmqlNLHXxaNfU5rF9Iq3dCWn4jXAd6aLvMC2dtWOqldNYQJ9tlW5Tk2dV6lB5a
	cnxycMnXxvPRJ8vWAH85r/AErhrBLz/YF58uTYbAdCzFVAL4sughCt7wOsYDk858
	HLmVTA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dy4g4hr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:04:53 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82a855dc82aso4707426b3a.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 04:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774436692; x=1775041492; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8G6G4aosQtrA9tx+ufEAxzAUa9Gs2oXeFM26jYouehQ=;
        b=hhQs+m2QpxicIYSOuG9IUrKfpc9nOWDLRaqYRUvV1EfYupaBMaqrZuYHQ6T8m9vx78
         qVdMcx97Ir1LvC9QGIBsTOeaug2muSg0u30vSe8BPsq96u7U/Cc1eazQ0D9eZkUiIZEg
         ISBLEfYyhvgra09A0roTxL7O1gOA3ZkWuxO7NvLxpEKPaKDxFo9jRIxAJpEcplRxjEmv
         0IK25B52CK6vpzUJSTr5YGwh/Cm4P3wOMUznh6isFDCsDaUok2GCoI8n6CBqjQLoxV/7
         XH4LMuTcnPJpz7XPkilnKC4QEZTPFSxJrUe3z2WIBMU1apriZ5NWd6ImWiJ10qZMFcHc
         fTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774436692; x=1775041492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8G6G4aosQtrA9tx+ufEAxzAUa9Gs2oXeFM26jYouehQ=;
        b=fNbJO1FDCqadC6uHPZln7hR9ht0N8Zpq695uXCrZhb5xonrFn+fWFUrVisoeoPIku8
         MfC8G2DILqHhtQ8qTYrvM0KldO5gxo/3o+weYlosGCAujfnflV8NV0uS6AcCyZRAOOa0
         /dnTsGkQrjC48942ISHLqWQh50uj1LTOnBSuV9y9QXSqJjcFqrmwvfr92f2pimoJFbgB
         10ocJ5v8US9sA95Ls4cRgh+ZQl3z0DlKOsYQtEiY9FDyGqY02gmrcrVA7Rcl/pwEwqSq
         2WaskmIPwhfDVUbJwSu9tiwcJQh0lGtvZm+BZUvVTB9k3N7ToFA6ic1nkDTSNWXKIiwr
         cGnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWh1i5E3sBL3+Q66hRG45F6h0VHff4pH+mLRys5L4i7h3hh/QqUR8b3Zsdva8XWxsmfcy/oyYyaRUQu@vger.kernel.org
X-Gm-Message-State: AOJu0YzXyD+bM07h9sXmwbAlixDqHzhF2j69m4jUWUpanbBSBOj6a5t0
	p1DFFzZq/w8MHlk3Yx7ld96fN/4DvHWTkmajKvssYwJ8+tvsqZcgv6z55EUr5niLlbF7bXaFXq3
	wvpwhkqi3r1LeUG+AN7j50LyRVDU9tKUm3+mLotboCdLSWg3ScHqiZCLb6oeP9jT1
X-Gm-Gg: ATEYQzxVk02B9wSrcm1HMTkCAJUzW2OgRoqg8pGbssalXm7PEEpi/24NGJgAkggKkCy
	up2IcAiE2JWYDaZSyIHfcW++yuoyGHT6VjNV67HH7XBZsjfV6KY+CFLuB2a89zjaaDMH/5Sj6HV
	prmU4mcivOh5YkVZfHkVSWs5ha9NNqzznWSf+zdHTHyNQLmfM0bhC/8OH48A9I3Jd/+Wl8OLfrS
	NnDngPxgG6BDgKIrwPvLkIaUr6PfD+KM2nRuuHxKtWf/NAaPc+CT6a4SnnGI5E/85OaevEY9TlV
	IevzDbGaqOwnOVdxrL8HSbpi3KKJkKRDQDG21Gb3HcOenesRIcmmIn5o6wrdeqhuFe//6Z+n+3k
	Y1gw1Ew8Zg6es59BxzaXAuYiL8Hsnkahof/+phbl0TyBcoE0LnSMdxA==
X-Received: by 2002:a05:6a00:9089:b0:829:9cf1:642a with SMTP id d2e1a72fcca58-82c6e0ea945mr2890094b3a.47.1774436691968;
        Wed, 25 Mar 2026 04:04:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:9089:b0:829:9cf1:642a with SMTP id d2e1a72fcca58-82c6e0ea945mr2890048b3a.47.1774436691346;
        Wed, 25 Mar 2026 04:04:51 -0700 (PDT)
Received: from [10.217.217.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7ab97c1fsm100790b3a.60.2026.03.25.04.04.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 04:04:51 -0700 (PDT)
Message-ID: <eb02b13b-50d8-4fe1-ae5a-7378ca14726b@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 16:34:45 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] arm64: dts: qcom: kaanapali: Add PMIC devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-1-70bc40ea4428@oss.qualcomm.com>
 <3u6yfqqcxrmf52dl6xxvnrg4jtmwekpm6n5t4p4ujead3urxqg@dognueejo7hk>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <3u6yfqqcxrmf52dl6xxvnrg4jtmwekpm6n5t4p4ujead3urxqg@dognueejo7hk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3OCBTYWx0ZWRfXx4rbmeIweJ2M
 YVHFsTsvWsRd9dQbz6TUAMl07Pl2ORocxSNzQw9H3T5J//s7in0ZP0Zx8sLJLi891XPgSYK0Vrf
 WB1eHMJG9SR8S7Xzwnzd7NKttYOx7G3UK5o410nZADsWy+l4nX1RDCi+Is9k7wAManzAcpQfrdD
 KGba9zUiOXjax0StfJKaOTRV+/auNSnrBKWjbA4cXOCdwSRM58O0ky/ldeglMvs6PUsXvGOukZk
 UAKgM5m9ayTidRNNoAoQ5gtXO2SrI+ULnd4ktb7fBMlyRn11SviOAgtWWLPu0QBSJ6jWeCJpcFV
 Ph5MNYAYmfRRPD3e5QdgnbR4TILUIRl3ZW1G2Q/+1wEUaW22sYYGv8z/nvo5bgZvs2eHF/qSQy/
 1AZP6HL3ArcjSR9ZsCDi3LPsllK49XwiD97i2+uCvOUzeLiJgPfOj8hkzLvQBExuiH0BC2ZO36p
 qvtOVe66TcjhN15LXKQ==
X-Proofpoint-ORIG-GUID: 4w7HIDMwbbNdjgGp4qmvRqaDgucs9jXz
X-Proofpoint-GUID: 4w7HIDMwbbNdjgGp4qmvRqaDgucs9jXz
X-Authority-Analysis: v=2.4 cv=eeUwvrEH c=1 sm=1 tr=0 ts=69c3c155 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4yz47Ds6lqWh_D6oclIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250078

Hi Dmitry,

On 3/24/2026 6:42 AM, Dmitry Baryshkov wrote:
> On Sun, Mar 22, 2026 at 11:19:41PM -0700, Jingyi Wang wrote:
>> From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>>
>> Add a spmi-pmic-arb device for the SPMI PMIC arbiter found on Kaanapali.
>> It has two subnodes corresponding to the SPMI0 bus controller and the
>> SPMI1 bus controller.
>>
>> Also add dtsi files for PMH0104, PMH0110, PMD8028, PMIH0108, PMR735D
>> and PM8010 along with temp-alarm and GPIO nodes under them, which are
>> needed on Kaanapali.
> 
> "Also" usually points out that these should be two separate commits.
> 

I thought it was slightly better to add new PMIC dtsi files in the same
patch adding the PMIC arbiter (which they are dependent on) in the main
SoC dtsi file, like in here:
https://lore.kernel.org/all/20260219-upstream_v3_glymur_introduction-v8-3-8ce4e489ebb6@oss.qualcomm.com/.

It looks like this patch has been applied in linux-next now. We can
add the new PMIC dtsi files in a separate patch going forward if
that looks better.

Thanks,
Jishnu

>>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/kaanapali.dtsi          |  47 +++++
>>  arch/arm64/boot/dts/qcom/pm8010-kaanapali.dtsi   |  93 ++++++++++
>>  arch/arm64/boot/dts/qcom/pmd8028-kaanapali.dtsi  |  62 +++++++
>>  arch/arm64/boot/dts/qcom/pmh0104-kaanapali.dtsi  |  63 +++++++
>>  arch/arm64/boot/dts/qcom/pmh0110-kaanapali.dtsi  | 213 +++++++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi |  68 ++++++++
>>  arch/arm64/boot/dts/qcom/pmr735d-kaanapali.dtsi  |  63 +++++++
>>  7 files changed, 609 insertions(+)
>>
> 

