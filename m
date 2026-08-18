Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1170046EC6B
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 12:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787056625; cv=none; b=lV1jIgxRu3PLIjoZGGM2+kyD82YjIvQOJpkkbnIY1FrrKPWQfruv+2SscACQYBATiqP6k16LtrPS66112APiW9DraMrjVNCPlf4sETPLTTzZxDuaoSy7J15QewQ9PDAmcbGUqM93NusCQhzC3rEVDQ4FU4FtMu8X+wH8Ayd8oBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787056625; c=relaxed/simple;
	bh=ia3tKnf/p1+sAGYx3IMxdiSNORKJQRIDq3/MVHaRTsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WErUiR1TqTnONPr/rjH1ZTxmdzN7O8GXxu5MWjfXA9vF1cLARiMYdO6uT8LpWRZNOh+2jS8l9fGkiFdM2/MC+JoI/SLbvHxDN2YFFAR8AqAh3Kgtyu6vxwIzzhInOkMPxnH4t39x74ytx2aigHvOdWQ+B2YYpRhW4zwHjb/sTMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mjAIndzp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K4iLSEwz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mjAIndzp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K4iLSEwz"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABlxB599547
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 12:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xuI6sB3b6Zjm8p0n5YYO+VbCGiewnxqKueBLJ9fg8pY=; b=mjAIndzpNSKPSGP3
	fHq8PrY6G2bd4P+vgAyKlYYA78ugGJ88Aogs98hploFWBlgV+9fLkl7BZczKe9am
	j3/B+vZ6mmm1N+Abau+6R2/8vFfaHRmPfywF5GNlov4Aw3O9HxZUQYkUPl4eTAOh
	7nvpWuci1yYPPD3u4624F4D6PRQ2RLl+clUmc/TodTrejq5gwfrOApHKAXWbAIyo
	KPP5/4x+zm4zvN0R3uHTLlfXCmWnSo9oDKB37Nq0YqO8oS3qBAMHfsTjRzVNE0Ra
	cH/eZSauUvRWbhlnBBhnH7pevMk+JERatiuwv15nwXCqRcN4skvbIjTpucjk4iMG
	+/D4ug==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4eqttaxr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 12:36:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9310484c005so5541185a.3
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 05:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787056618; x=1787661418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xuI6sB3b6Zjm8p0n5YYO+VbCGiewnxqKueBLJ9fg8pY=;
        b=K4iLSEwzeDsphv12ezUdcRL0UmfoTIRh4ayLZPv5ve9aVyG3OkBkyIWAesuw4d/Brd
         NrkNF5eqUJauEh9xMIliaBuyu1P7sDcNew4m6lj8watmgJFu2c61dd2BUWtVt1qhaSbt
         dvimiENid+kkubQh4dHXLrQO4o8soCgUgkrA4tj2UPEx0iV38vzj9bKH5JRjq5HP/8DH
         PMngyvlH/YbJLApOC+9eTpFA+OB43arA2ECei6/UbWs8AM9ikQs5ueXgihYXWPXnOwDN
         HN32GWbyEJ8BGvLxxteCiWJhvzco1h2Z81qowbVAAODu2u6dZkvuR8nMTsqSLpfzor/r
         gZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787056618; x=1787661418;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xuI6sB3b6Zjm8p0n5YYO+VbCGiewnxqKueBLJ9fg8pY=;
        b=sLUPYzkeaRfu0DaDwOFdJ3G9JASUyfyfacG2VWRpVHXK6SclS+bzHgLHitvUGiYOW8
         nn/+qVg0QBtvWmMMA6lLaC6nxizJwCoohTeWQ0hy91CHx4jW+CN4JEBD8QwEA6sc9smG
         f4YSeNBScWJk5JJBjW07h4ig/9EzE768Lt3QRoJLPMKbfFAOgqxirrUrF+HRqFaABMnb
         DNJLDNQ5DQEGHvKvpqhPIRR8Jc8J6rMBto6rGdAVhBDsqsce3OhGS0UEqBslqPISLZwK
         ACngQh5PTDtj1QQ6tpmTfCj5nL3fWPO7//ckGbjmG84wh/VN0DUnmrnIHkB/E6X6dCfm
         sFIw==
X-Forwarded-Encrypted: i=1; AHgh+Rp5F/KDlJLmzF/b6NgVBKtM/gXarDxYUWW2ag8Ky6E19FGB+qaRR3g1iN9K12on9EmxQvSkf3cYmoHz@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb/3J6F3XwBhF34VJ8Us5HPAZN4Uzuqnmm0+ZvwaP9BI6ZoDXX
	2EbF6iGd6n2I9NYhlZOponJMEKeXXkVkpFZXayVD5ljNelp2qp3gqKH2BL/UGtH4Oc6gfKZB+vt
	MeIv+/jOH28ki1T8grQBcv+LZFgCri6SV6Jwtpu9zH34XMXhTDAjCqCqmDCtpB2ig
X-Gm-Gg: AR+sD10O5DhAaVnxSXSCbasIAWEswr4Me9IuiG92x+8wY8MDTqo7881Cn2EnP5LdtSt
	ogzZCEG9h2cXJQwTjS7/V369yNYHCQabArbp2ig6fRhlU5HuorslaIZ5xjy4AyPiMdufJp7vyMZ
	MGJ57f/bKBAbhctE6eFYxAhbUOmVVk79Q0Bw1rxe0f/i9foOqr3D3+qou1anaDhIKFAxWxYJcmG
	RqzzMtGVU8menbj2VI9R/1KbSpOgqD5qHjCE2fQMO9Ku/vsfAZOaACPFZtmANGMJFVbzmIYLEQh
	gU6CKou3+YCoSC0R6Ob3ptPBYpwY8jaA4RIPMSX9WlKZQKy8xINdyZRlMXNHnFAhQkxS4/ACbEy
	uOX1TsWdsuq8v/RwO5Gr+qq4V
X-Received: by 2002:a05:620a:600f:b0:931:23a:83ca with SMTP id af79cd13be357-936d23849admr2609344985a.4.1787056618285;
        Tue, 18 Aug 2026 05:36:58 -0700 (PDT)
X-Received: by 2002:a05:620a:600f:b0:931:23a:83ca with SMTP id af79cd13be357-936d23849admr2609339685a.4.1787056617865;
        Tue, 18 Aug 2026 05:36:57 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d8588655sm1733817a12.18.2026.08.18.05.36.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 05:36:56 -0700 (PDT)
Message-ID: <40868661-4a52-44bf-8ff2-790c222c10bc@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 14:36:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] arm64: dts: qcom: clean up PCI function nodes
To: Alex Elder <elder@riscstar.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: krishna.chundru@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        mani@kernel.org, sushrut.trivedi@oss.qualcomm.com,
        umang.chheda@oss.qualcomm.com, rosh@debian.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260807195846.456079-1-elder@riscstar.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260807195846.456079-1-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA5MyBTYWx0ZWRfX9RP7uImOEL5G
 wg91+PLAqd2hRtesk/uZ7m30jCXzitCaH1G46p6UJtxCHakPcz85m1zihIzV9ofbqSQE2yIqR27
 7oPxoBwJj1DSekCksOpdotpNJPAwZ+0=
X-Proofpoint-ORIG-GUID: iVVNPw1Bd2uqdDQtDm6cCi4LF7GF5KVy
X-Authority-Analysis: v=2.4 cv=UfFhjqSN c=1 sm=1 tr=0 ts=6a8451ea cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=-CsPNILjdqOFwjpKq40A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: iVVNPw1Bd2uqdDQtDm6cCi4LF7GF5KVy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA5MyBTYWx0ZWRfXwsSV3iiACAZl
 c3AHNb0UrEbcR/VB7ve4lT2x2nFcERCibycax2BRywMBg2CVmj4tV4CgJo6dae3NLIDqktYlaIo
 0d1axI+psM/Sk59NIPaJ/OH0/3IU3GLgb0+EbTsmk4VCZZdYAyxm34OuU43FWqx9A+8GayB+fSn
 xU2Fn8IbB1eJBp83GYmMHnktrTKv/nEmoZ2VJ8cQvh/UUIAt5sCROvoCH0I1WuohrQxWHSLGE/f
 YBdjgVc5co85jJ5Gtdj/5Yg/vnNWSbUW1FQ0+cwB1BcxPM/mAHLg1LLj8r0gvZ4FFekfHO7tREB
 RdrKp5aG29RZpsh5MXjq8tdJKE9jK+UswR9dkUDrj7oqI0JUQLn7cOmukwWgepR6xy3djhyl1Um
 Pp+lua6ssr0Zp0HL9ymPiJ9UXxf0I6IMT9v8suGDhcCki6oZOexU9w1PlxJKXaumJPUhJvL5Tkd
 dKlj7TjYVlSZpyQ5koQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180093

On 8/7/26 9:58 PM, Alex Elder wrote:
> While working on upstream support for the Toshiba TC9564 SoC I
> learned that its PCIe endpoint function nodes included the
> device_type property, indicating each is a "pci" device.  Herve
> Codina pointed out that this is not correct; only a PCI device
> "that implements a PCI bus" should define that property.
> 
> I looked at other upstream devicetree files and I found four other
> places with this same mistake.  (All are for Qualcomm platforms,
> and all are for platforms using a TC956x SoC.)
> 
> This series removes the device_type property where it is defined
> for a PCI endpoint function.
> 
> It also removes the #address-cells, #size-cells, and ranges
> properties in these cases, with a plan to restore them only when
> they are known to be needed (to implement pci-ep-bus sub-nodes).
> 
> 					-Alex

For the series:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
