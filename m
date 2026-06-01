Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B776B36A377
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 11:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780313897; cv=none; b=B7995pqK3fhC0/s+geV86K/sfy4sLd9EnE27wzOveVvTJxQEUjeINq/nKeYOTDj6AoI0Ja90juZAKqYKZI4FihfIRCTk4kflTU+puoqbfwGePNmiP101Zb69c4+qVvv3H8RFkkLpqxlU5/17zk6rBMExKkQ7xt8eNpdSRiZ+0MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780313897; c=relaxed/simple;
	bh=SWTIaQyUE0hLCUIIN5L1msdquqlW/MHKkBotVFsNjh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MGJea2GbAdwbXGAJNk+rOKlbvmxdXi0nUG/f2TYMtH+4g18ao5Ny3fNsPAKk7/ymCHucpWrlUbmFTGkwHnxpr+bN+RU4euMvTqAm3a5C68ohKEBecEIJdJp9X0EkVW7EqFM0fEJqT9UMnXt21TN99eC0Uw3AIoDb7ypLad8f4uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oX3KzpYV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WGmc2PNy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oX3KzpYV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WGmc2PNy"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518fXDc4065646
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 11:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U2uhUbSn+d0+wL/JaSPYQdq7
	U5EkDujpLJ0FBYZnkRc=; b=oX3KzpYVOqj2ALE5wZmlP8c0N8xuuhE8BR7mwEzs
	s+ufXextn5U5hNhtoeqlYFZsZJycNhDXJMGvQo650tiGUgOKgEMOv6tvyrT10uPo
	zR3+OEE64UWnW6mMzhlMgejt//eXZktSoYLoqlDW2R0jhuxF46E6PIx8Nz0D4aB2
	oUi8xAWL0FQgf24uMvSSsDtoNy7/13IcL7eRRbmiyIzKXRbKNLP5Z2LQKOPIaudw
	dshGRd7FOFzMtU7NvyRb3qD2wZv3MGGyyjcP45PYGOfOXPrJIN/ZPcf9qeHsGaBA
	sBojjBC6mMv8m9wRJtw3vD4V5EQiY9+dKCN+sSvXmbb1lQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6swrq58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 11:38:15 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c69c788ce7so551416137.1
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 04:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780313895; x=1780918695; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U2uhUbSn+d0+wL/JaSPYQdq7U5EkDujpLJ0FBYZnkRc=;
        b=WGmc2PNygVeB+sju6wa09j9LzH9ySUhgkUD3+0nxbY81sa+zICSOgm1lHUihBLL3vH
         Y2gJoKLnVbB0N0CYr7/l8Wu59S2IF1IGimQnev99QPxUaWNT50YPcmKocmQTwVO+T63m
         MUWBgKsvC7qz/s7tSN5BiwxTF+3t0ZCZ5Pk2PW5wjIljcy8pELAUiYpJNTfKk8u+QrlJ
         PxkeReTAd7BdxLHp9MYbF5icm12U6BHVaWldOnJsXJ3GTpNKNx0lKX0CnST+L+EZiIYT
         RFefdUDiGqUeBfvNO2gQPgciwQCMRUj+NjZMTurnIgok58JGyGErmmiMWUD4pqxvHtlT
         9Qug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780313895; x=1780918695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U2uhUbSn+d0+wL/JaSPYQdq7U5EkDujpLJ0FBYZnkRc=;
        b=iniRaUbznCPR9CwGzyVi4bpthlTNDzfDWs6POELAHXlhmy4fRhVGuKTl1BZkaLiIIK
         RYYHXeDUleBZJXK9N3gJddx1G8+OfphssL9LItUcEzh58gojLu346u+Da/yf0p1hXrHp
         ih7RPua8dWoq7bsn9cSsjFc467Aeqf9zkD2rREkzsTub/Rob6SJnNxaJKbYCNJaEgeE/
         iPdJfpGJUfWcZI3YMis6ooqp9GKo2p5BcXgrxhh0U4rrS3YstAUo8Ks7BI+k9gRY/NS4
         w/LlUbqqGlvpou/5YZJK/0G+iJS+w+4qYG/zq1XWVM9WfvAivuitPYFz1fNWlfUVWsFh
         4iEg==
X-Forwarded-Encrypted: i=1; AFNElJ+Rvm6h/3t6sJQw4KFskGRvuxR1dSON8fW22CS5DfNUTPlX08HC9rP9C/opPSKk4UiN9piLuj3d5yJ3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0f3UOB1DB3kRf82mDez1Z5eqWLU1RDu6L/abGjYuObnawbrBg
	GqBoRVekKD+20FZhlTiseOOlU95Z8EcJX0mqubCa9jMBw8iuuGRHZ/YzB3cFeY8wTD3CG3Y95jn
	RSNUxojYSFRvbP47lBr3ZgB9vckoSq8uePk5rKwxIKxayeocBweVImYspz7WzwELp
X-Gm-Gg: Acq92OGD5XDZYAX8OlRr8JC9rXpsohw4XMBNW8+t7Gza+BpxM32xWuYV1D5AmbVJoqb
	zQN028xQ/3gdKMKA1P+CHPzkb858E8FCnURVDY2CDxIt/Px6qbhhprDwzIgWvzj0yDdWL3dY1J0
	0jvQMnCDLBJib+BrAkhCeiOV8jnQkSjSzpcPHcERjtN4irvEDNocx/70iglkn9nzF0NeekcbhW4
	dXI/yVybo8F8EdFvQb1vfdJmLRaLh1rAmFcTJ1G+q03OZ0epDeAz1sZlt1/GaTamwFr+0VU/QeW
	PL2/V10HWB/DyjAtjzPhjn3VWghiNM81MLXGKe9lcXObTx7D8o2HHTGCukPSwgcym7zztVp664E
	G6M9IzBA8HKFwjybwMjGpY73wBcqSap+00gytPZXbr3SZt5aDqrbjjYY2ONC4uMvVovMUlELcdB
	K8S5SOyh372ScvLTGVWqsbrCPLpo/xSmzJdSAOsxcLq9YiQg==
X-Received: by 2002:a05:6102:3e22:b0:631:26f6:7009 with SMTP id ada2fe7eead31-6c69b078cbbmr3454931137.26.1780313894863;
        Mon, 01 Jun 2026 04:38:14 -0700 (PDT)
X-Received: by 2002:a05:6102:3e22:b0:631:26f6:7009 with SMTP id ada2fe7eead31-6c69b078cbbmr3454894137.26.1780313894373;
        Mon, 01 Jun 2026 04:38:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b06879asm2022024e87.7.2026.06.01.04.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:38:13 -0700 (PDT)
Date: Mon, 1 Jun 2026 14:38:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux@smankusors.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH v3 04/10] clk: qcom: clk-rpm: add msm8960 compatible
Message-ID: <rvs5c4shgeroxsllqtxyjtsrb2447yprucw7qtmeissbbxtvtb@24nexo4dy6r4>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
 <20260601-msm8960-wifi-v3-4-fec6ac8dba02@smankusors.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-msm8960-wifi-v3-4-fec6ac8dba02@smankusors.com>
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a1d6f27 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=wxLWbCv9AAAA:8
 a=pGLkceISAAAA:8 a=5PoCL-xiRuW4qANWJgcA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-GUID: VPDwmhn3ADeZBSi6qHsbGCb3W6-ypQ8n
X-Proofpoint-ORIG-GUID: VPDwmhn3ADeZBSi6qHsbGCb3W6-ypQ8n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDExNyBTYWx0ZWRfX2ICw6ZHsrX0K
 Ppws0L09Hjh9IJjZ9iqGWNU2Y5z+zfZvd4gMtRM/kWxn16Tngu1Uou8npcHNoFCwlE+p0dnOpf9
 eyE1NNRPd4UKRrAeqLnmn7TEZy5ZzTArw/TgFdbVqLObH4EM+z0au8pEbwyRExjTHU5sgR2mi6B
 IH1WCnRjFQS+992i9ItJV5eqH16POBNbJwdxd/e0zT2fG6XrSV2B6DviqY+ueRnALYpvA+xXqo0
 0ckkIfjAP+4qDP0FpW0e9oahhtzGlyDsYAqfMTTOax38TKJYh++JsmFeN6Zal+yqaBsxC93lyei
 lCgOy5DrDrFqztPzZb/871QAN6vP4l1cwAP12XkjnX4jouS/PexsouZ+jrGaFLuVEKUuzvLpZ1M
 hMO4NmN7IX3bi/cgIasI71WtE3D57m27WymChvu4uaUDE1RyxAIinMgdBnSIRKPH+qwV9PW3qjD
 LlanINSdQhA8OhkWPHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010117

On Mon, Jun 01, 2026 at 03:51:17PM +0700, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> Add support for the "qcom,rpmcc-msm8960" compatible string to the
> RPM clock driver.
> 
> msm8960 uses the same RPM clock descriptions as apq8064, so reuse
> rpm_clk_apq8064 for this compatible.
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  drivers/clk/qcom/clk-rpm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

On the other hand... You have added APQ8064 strings as a fallback. Is
this change really needed until you actually have SoC-specific quirks?

-- 
With best wishes
Dmitry
