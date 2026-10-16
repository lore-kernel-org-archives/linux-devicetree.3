Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1D82D5C8E
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 10:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146302; cv=none; b=qttNUo07p+FrSvm3KiK7eEj6xUuzAu5bhFaGnDO5qCxGfODVCXK3MtZkZyaQaOFyeKkNQKFfTu04PxGvAtaQqAmrkH+3BINYY4gq9BKjk9EnkBfOJ1GtagmsPgslhWZltwyB19ykMsC4tgxf/UVvxUQNvJBEKSAEwJ9fTdONTi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146302; c=relaxed/simple;
	bh=i4Z1zdQOmksCm4c7UuNxZfLkKScOhca8kGgZ8QgQm30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AQEsdYMIOuKpHdXXjJI+i+UMX0pFhfO2d+5HtC88+3YrRyFz5eIFBVwRQxermD02jKBNoKKwLWh+CpwtfRhofxyPN7JpeSwBzPP6aGoshfKj8TvZrFWBSJskCtYTfRvqgJLbJA6uqoZFlwqofxtRTu3WTof1bC9FpusppM0UvMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VecxJ3Sa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cg3GOHXa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VecxJ3Sa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cg3GOHXa"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAA6Eo2403042
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 10:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kAlSZDNs3K6ft0MeWMellUDE8pbYaYQVgrb3o5m3fuU=; b=VecxJ3SalVX8847m
	gVJPDFKsO2vvc1aSyVNPYY5N9n5BLJoHtQ5Fh1QdYpKvV2qFQ5vFg8aaeB1HNXwJ
	FQp7l8bDbiAgaToofZdKHO5u0UvLmYpeGcHmRA+7UZwyQLNn8nAd2FUbhF2C4f4t
	Lc0yOeANHTcbRTlAZf2OGoWuC+3uX2aGu4e7DbW1w4jdNQGVfbwWOny4NRKzXi9Q
	dkWuGNGvpE9c2GdMChJmVhtDnjdG5tzjOOncCkUUU2btJS+yfHTK/NS1aCvEMCPi
	ASf8u0aq3xRavcaFKKy/k/513mbHbAAXdBu68Ral7zEvZwNWAehKI5+1RAuSsLxV
	6S18AQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19m3yyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 10:25:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53389750985so13192111cf.3
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792146295; x=1792751095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kAlSZDNs3K6ft0MeWMellUDE8pbYaYQVgrb3o5m3fuU=;
        b=Cg3GOHXaADK2eozOrfZNC8EmskylM7qyMYcQ0j49U2xgwEwgv7MMpXR3MDreLmjftQ
         awg5Px7pr0UoDPBBZRz8VXdSi31H/oLpqYro/PRFRSDp/U5Ys9l8UYj5n7SndqOHZFHR
         S1l44Qk2Q2l03gudEpfUYgn7MVPRQFbukJ8uzUdhFKotzNXGPXyleEL3CABZGLaGgAh3
         mzkzPX6z15nwUIyp3h/e/fHalI4oKrbECyTsFRa69ipNfUdFShuXSwSktqcQz9aeVsLy
         9duBQV0EWjX2qtkC0X5FX/hBaeykm14tFdqI0IO5lz2MzUScbqcNqEWN5fFvd9XvU0vX
         ICnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146295; x=1792751095;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kAlSZDNs3K6ft0MeWMellUDE8pbYaYQVgrb3o5m3fuU=;
        b=iR9cbfhGWcb8iSK6QoY4FeNQUgSWtS1RBKIIfx/s+p3nh6fRbU2Ma1ACUeyIDoWHdq
         eFNDnGWr1NcDqHdvrAbycYL3x39QP2xTKe6Ua5yBrm6KU+l4AFx+8Y2C0/7+Ua0fnWVo
         k/sS1GZqyBf6Efxj+G2LltTKCcS2VXNCynHAPLxpcnh0/qKQ7rFBbqyBtb2dgonF8LjQ
         B9YTTMyp3z9DkcxuYwOPU4sjMzJN/evsfjJy+eNMtyYYR6BTqVWw6UcbOPkEuzjzUnsB
         rctehQrGam4WclwsRcgx88Bj79v8RBvl4EoZAxtO1HfnkAQEppgbAqKOMgdxZOFkMxAa
         iypA==
X-Forwarded-Encrypted: i=1; AKwUvBx1vMQl6H4gZqmP1zxUDBYmPcJYqKdKdQVVWk3Wj12h2/A7WT7CIyEBG3zbsv1ssp+J2vRzqN9rwTtK@vger.kernel.org
X-Gm-Message-State: AFq9FYJhkG9QguZUsoLPl8IkKdl/nNbdCYdOYWfq6bVJHkjusIdkPfVn
	9VoL0ORRF2atiVEi+qh7gPCfoyKFF4wAO7Fz5otGMj91aTIZiuENv3okOylLdM2ao+P6UHYKvcJ
	ZqaYPb07Tw8gUIyEBQABYpLu9d47DkQHDUrQon7hpyQCHY55xREevIfxpNTtWolTA
X-Gm-Gg: AYBFou22nVU9FkZjfa3OGFVSOv1ib1hBROkkE13ucjTDOp76jp3ctrCuTotM1ZLNpch
	xEAM+MmBQ8iIlL/bWOh8oMvae7CNLYN0wqeZUW9EwbKUdSnmgIYDjsFZpXyI6A5EzYZC+QP/d/R
	/ZNf4SGxnRP5RbN2xGyHx6McXve6Vdyw2t6/2pqSFyT3GRULn7y9JXS91Rl4o4eyRY799OSOiBw
	qUGEpbdCEHgOc4AkIA9oPX2mu4uLnTByH9xK66B2ptaeUcVA6qGEmJgafF2A+IyHPwMJtupqvCc
	GEB41PghQ697FgeCIq/LLbPAo3RpSW3dpEmKEAgmL1bgXTaMK/YvyJIUrj/AmMBpbixv3x3NzkC
	8oxkIlifI1knytF7QcUwiag==
X-Received: by 2002:a05:620a:2855:b0:939:8148:1e3d with SMTP id af79cd13be357-93ebd0d7987mr3686937985a.2.1792146294544;
        Fri, 16 Oct 2026 03:24:54 -0700 (PDT)
X-Received: by 2002:a05:620a:2855:b0:939:8148:1e3d with SMTP id af79cd13be357-93ebd0d7987mr3686935685a.2.1792146294032;
        Fri, 16 Oct 2026 03:24:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1c633asm749378a12.16.2026.10.16.03.24.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:24:53 -0700 (PDT)
Message-ID: <7cda0970-2ccb-41d1-985c-958bc9fb2a73@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 12:24:50 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: qcom: glymur: Set
 snps,resume-hs-terminations for USB controllers
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016091336.2715717-1-peter.chen@oss.qualcomm.com>
 <f28d3582-37d5-4443-935b-615a7e194767@oss.qualcomm.com>
 <atHvDcClXC3smt5U@hu-petche-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <atHvDcClXC3smt5U@hu-petche-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aLdlOr9m c=1 sm=1 tr=0 ts=6ad1fb7c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=TzX8eDZg1TTv6Nxa36EA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: K46sejAwf8js8HoFT_5tqHer6Gdffb30
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0MSBTYWx0ZWRfX+oa6F51FHz/t
 Bay8+7Sz20KtWCu/mnuRBWNUIp8bSKdwYnVRP3Ip17V6ieCslOdHNpoFw4N8hoYziWPBkDiAtMI
 au1Z2zCrfdqolS7NuJ0O/nuUsa65jQo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0MSBTYWx0ZWRfX3WRHCRtsR0vw
 6M4o+lCpHAfeffM+jprJm54eRC6Cnu1pB8vilusEuLCps5XghXVbZJjfuYKUm4osbnTKuDt2w6o
 59wwY2nJu42R6D8XpHh0lm6hiovR10YJ5NRliOwMDUv/bCVXY9TJca1kOMZGU2m9xArVNx6NjJI
 dI8rUUfDpjqjRHjDdGa8wcE+vGeVFHDRntBTtVBh0EO6DcvdljnioltG7Gx6gdIKGkhJCiPbJub
 DAjPJ8Le1a8gNgmURQS+oIrB/9SpMtzg1mo6XMb7hLa0LIlEg0xbXowgZaoz6dZn58A3j1sR/zN
 5EUlGX/oC9A3mlFRG2aPopritCE3L1L9ML8p5RmAuVau9ekI+qxWxQ2zdzlaMXAzhXbzp+69CZH
 M7O51AJkoLWgu+l76s4rRnoIVUIeVJKkmsDXIJxADcWEpulZ5D6tqlRce64Ch1iS9Hj249Z4bx/
 vNQ1BqBfYU+QDcD9lBQ==
X-Proofpoint-GUID: K46sejAwf8js8HoFT_5tqHer6Gdffb30
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160041

On 10/16/26 11:31 AM, Peter Chen wrote:
> On 26-10-16 11:24:05, Konrad Dybcio wrote:
>> On 10/16/26 11:13 AM, Peter Chen wrote:
>>> The DWC3 controllers on Glymur are paired with the M31 eUSB2 PHY.
>>> According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
>>> (RESUME_OPMODE_HS_HOST) must be set.
>>
>> $ rg -i m31-eusb2 arch -l
>> arch/arm64/boot/dts/qcom/glymur.dtsi
>> arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> arch/arm64/boot/dts/qcom/hawi.dtsi
>> arch/arm64/boot/dts/qcom/sm8750.dtsi
>>
>> Can you send a fixup for all of these?
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Sure, but I only have Glymur CRD, can't test this change on all hardware,
> is it okay?

The hardware programming guide says this is a necessity due to
the hw specifics. This is enough evidence - you can then ask some
of our colleagues who recently submitted support for these
SoCs to test it out.

Konrad
