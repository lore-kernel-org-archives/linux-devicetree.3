Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793030124;
	b=0KK9GCO6oPfr/zvyjoCxpjsZ2r2pkCgZC3AUGDkWX6q6DmnrTbRTP6I3nZyhc4b457UY
	 OA41nW5MQSK9RdgOPqS+RW8kZqmRrudjT/WhUnyHiJxgaSIP1v44hBV43VbHtvgO+VUBi
	 2VwwkQkkWPzLJLUqJwNwsHA1PshPanVcncMJtBv2Bmi5LpRSD2tSGp71YmmWVlqahmEvB
	 LsdZSGEwvMelaK/4ZjWJf+FpTjqz9A1QQ3sQoZBNVfI0NdAnAf4pzxQ4/YN3OEMw4Ky/g
	 jAkQyAzolYun1gbK4+wtHES6PqNqWqgMJpz84vf6P4O/WdVQcIQh1JpLyNrDGNsIHVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030124;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=08tb8cGUQgTzlrNjhvrJlu5bOc9BnVgBL+7qiR0zeco=;
	b=FU6O2O5rT/w+0OM33NYGfmSgur2+g6qBXlLFXS+SyePIR6skaZxNBHyzBFCnpEcyClBT
	 pfLhOEpwSre8e/5lMoP1AUcjpG8XmDDa1bhHR0YFT4blE5k7SPPAEFbqDfcCN8bkk27Ag
	 G68WT/gaCMjxcedJwBqzkYx2US6EvXjFaBfUXiRScPXN7B5woOEH/z1fG+nU61nXXeHx0
	 KpQPCo6SeEfK8HjfZnFZppUWooFIZ5vfHfVfFkGImTJwmY4FCgdLhU67VGJPcBvUsCHvY
	 j05n0xO7MTLmI3XmcBSNXDxh9sWzBbvqMZcR7d8EiA7SHD9H52hYGkPi0/EPKoLaNTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lWPPxewv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="fPJ9y/io";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606B1606A31A
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 15:55:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 606B1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lWPPxewv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fPJ9y/io
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvjAG4098797
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 15:55:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	08tb8cGUQgTzlrNjhvrJlu5bOc9BnVgBL+7qiR0zeco=; b=lWPPxewvOGSt1NOm
	Ok7CRiQeGvMVBomvdj+svWxYv2ppApqDxoT3WBi0xpMQ8Tf9gHOYDDFRQCBYwpop
	aniQ5KnIaoDG79D2iWs9RMqQLqJfe3qzAsMVrFVnCaJMvBFX/Yp5dk3OrOcHv2Gg
	ZKPNVFfbG88l+3GxzEHzS7NgAPAm595Mp8PKIuy/nyfeJrv5XEZ8wh/rTlfTqd9H
	MmwhS2A5KiwrpbPxM6tyokNsNNsgovb3tiZSODe/nTocJKYLlHn95xNgMoT5T4Jb
	Lr6LSxF50LhrLtMpk9inZSkQSTAwaoxuDj6uQJ8QQgLyQHfvcMQ1M/QDTlRSzNSq
	YK0q9w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4s91cf2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 15:55:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93dd3c3badbso777797285a.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 08:55:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793030121; cv=none;
        d=google.com; s=arc-20260327;
        b=CO9pTLLmphUdTv7OHLR/1Enm9d8Z76gWlqYBF2j7+8T1s+UJ5laLsy6R0Hr9PJdVbz
         wWBBCadvAME1gsrvfMv3rEpCAoU28bY0RYLta/zIQIt8L38zbwshCMGxcZbHntn2TyCS
         tAIWp43E+AdFIqwMslRZe9cusPlBHHlDO+cftvCe2ajh0H0I+k6IAiljs+N7FKd/zZGQ
         duR2H46MEOx9WygDl5Q7RE1KvuefgosHWRA5BT/lnmGRS0nCtqnkiqoZFFg5lL2ybvRZ
         Zo3j1FXoB8sTfYIoak6yUNCQQ0c1IfyKceFrzjHORj/8+CyNLt4Syyv57XEEvjXUk3MW
         uNJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=08tb8cGUQgTzlrNjhvrJlu5bOc9BnVgBL+7qiR0zeco=;
        fh=zWUpubWxpJO8Bf0rDCgjRPaJAH8bzDDn+oRPz4rAdx4=;
        b=WaergFU6aRf3DEZ9mWraS5izg9Kb+UMOP0tmK9IOP9+gLA6mg45ltXUyJwQtu+SlSv
         StoiGIdO4+ckSx1K1HGFro/ZL/PAraMZohfnO+wyKEeJ0Hl2IS0J/Hsy/ukK8H290ev4
         r9YFx5YoJMj/GdPU+RoJuBJegbO9fby2WXa9OH2xCHwWke//JSMxRHZOa5MWH9sh6Luf
         BEhUrXwCY+jcpNx6DmRbwGbuKwQQOB8J+qaGNdiMHY5AH2jfci0t7LoWm+5szwkiXlP4
         1Kb0Wb+mMtkEH2rRehJ01PvO8TCvi6acOeCtGncDyy2hpmgT4aMJtCGdbz98HBswDAgz
         fGtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793030121; x=1793634921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=08tb8cGUQgTzlrNjhvrJlu5bOc9BnVgBL+7qiR0zeco=;
        b=fPJ9y/iojzimRkzobifb4PXrCoO5h53pEhte+j6mhhhIgkqMWtrROWa6+O8bsIaVzv
         w9wnhGyibi7u1EWPBr/2O+0msgKQiwyDfS0hNTWi6SCBE+Tm44HX1xhCZtN+c60bfosm
         iCS/f7JokW7lkb8h9hbJCYt4/lb9rCF5WfDXYMUOczmz4ZQBHJYVMWeXcmopourC82WN
         CVcAg16wFN+kb5YhFb3y7SJNvNyecbL+KU6i+n4cEv4mn37P+E+AahQwPBe81iVQpRPO
         dI8sVtwqXzU9kjfN68t2LSISGSBfipAo9yubUTLy/ITFKu2+tDEZcrIxXLJpYKonvVod
         p9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030121; x=1793634921;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=08tb8cGUQgTzlrNjhvrJlu5bOc9BnVgBL+7qiR0zeco=;
        b=B6W08D90/I66PmCB+8Bsqv1KImqNIvdAEbHs1vGWjVMXd/ANo8dc3UKNPv8uc6efo2
         jcHS/gM5YYUaWQXRIMjk5NBAt90q8oM+4BFkbzTLbPc1nVNsdlnCjtvWhdUcJ96ixKSv
         OvZbTbpvI06nYPfkrXzxzsvSNlIf61S5Nm8YYKCTa8TVrxNSEXELrkvLNShRf9n6B1RP
         J06OZPqqGlaqh7e6scKBG6qB3PCwA+zafZDkK6xPrs3u/PxSYdppLnKCrCY6rC6eO5S9
         065dDlpHPuy2sbq7d9f31/senx3t5S24zm77HRHAr99qG0+xGX0fiInAsql2aVQxyOWo
         j8+A==
X-Forwarded-Encrypted: i=1; AKwUvBzjmd9Vbe7j+zLPFnClUNy2ZaYX5HpLaJUo9JkLA4Le30Au5OkxD73Q8hAa8/KvuIDW6kzz9j+QKYtN@vger.kernel.org
X-Gm-Message-State: AFq9FYJExgmfoHRoj2Zh5rzjzQpd/OkPXWmc6NlpZTHWr0r7DXfMIMp3
	39fXsp0GOAD8WkCoXvetXADq9mvRBNbTnlYxys2AU3tzObnC31WpJJCxEEmqi0muT9hVflOqxZ3
	/817l+snBmRV/C4F8ai0VTpJpGqVxgD1tyvx3JbzAu8M6ZFJgxQPOwXBLGskBdOC6bBVplrdpKl
	jbVEuWjKNlPCl22nD9ALrsMiN2zEZD3NeQM9lD3pk=
X-Gm-Gg: AYBFou2/3JKvqz5R8R9B4RegnSh/OyDQaMhADvtf7Awe/rt85hskcJa3eh1B4FxLWH9
	lerb9d68hrr1ZzgLMcpeJvZ5DU+fgLsAr3oRtqL8X530UEGfGPvHFQuOTUIl0AA7L4BcYF60fdh
	Z1QnbDaLMJ4D6oYLT5FYpWjDy+UTDNwPXGvE2QUmKrjO7itmzDI/uukOIXcdzu1Lww8KqHtx1Bj
	BAQCDk+NxsWIdTasBxyTnd3OLRQKYwa6AN/PYNfaGDmDmd71V1rfXJI8QKFQnqzrIbwjtHbzpcL
	IJDMOp6A9PRuSiKMXPk2ZLmvekaG
X-Received: by 2002:a05:620a:3704:b0:93f:3193:ac02 with SMTP id af79cd13be357-940ef980186mr1055271785a.51.1793030121351;
        Mon, 26 Oct 2026 08:55:21 -0700 (PDT)
X-Received: by 2002:a05:620a:3704:b0:93f:3193:ac02 with SMTP id
 af79cd13be357-940ef980186mr1055263785a.51.1793030120640; Mon, 26 Oct 2026
 08:55:20 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com> <20261024-kaanapali-camss-v22-12-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-12-7da3ea49c8a1@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:55:09 +0100
X-Gm-Features: AclHuK8WDpOBSzsVbZEzkBObqQEK9KTIZDHcYBzFPmgp6ilQX4B5wQt7XAh5H-Q
Message-ID: <CAFEp6-22zEVoTQ8ewQN4CGW9GARZB84Mp_-SO7KrteYERSew2w@mail.gmail.com>
Subject: Re: [PATCH v22 12/14] arm64: dts: qcom: kaanapali: Add CCI controller nodes
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2MyBTYWx0ZWRfX3h8NZk28hI8U
 ntM4NP8PgX5tOP1ccGC/UHoLBWa0xsnxzim0UFfoEeU6csbNl1KwkPTbCoz7lPmBMfeBUAvJ0VM
 zzYFO0sy74JER6hyA9A8H0a2KavwI4zVa/oChnCmYIOxiZwyBo3FePR8+VIVW85eLm8F296Rgcp
 DArldwndCvhJ2J0vCFmR2zEU8xGlrQGGtYnBhqVmk9K7GYrnMuByWsJxTXnCBydc3Em/RDSekzO
 fcerEiWl3MqhtMYnzoa00GCle8yRsnsMArPtXmXQ6kigExxSMfFNQoaZRRX/ArmoMO/cDJdemdQ
 svpsU4dtAYomkpzwFrfber4IMl7PDzCsZKRDtF0YeeFZA2WdnawmfbgeWQ0WLlBzQ5AySsRa+LO
 BIvgVF9RRvHvxKNgjwKNRoa8d8P43CWuy6XyF88MXH91Rq+kbVNcEG6dmV17qbQ7H0pmQbfpFpB
 rfU604GufqQVP4vyTXA==
X-Proofpoint-ORIG-GUID: 4Ik8M_6_74M41UIS9A11wOm0_hyGznDN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2MyBTYWx0ZWRfX9hb2dHz3ZCB8
 pYQyIdkYVeXGgstzn5dBAEq8tH1zklTASKixGjYjb8k6+TCm4iVo1/y5RlksP1LA1dDOKCrKBio
 hot4qUUYKVfLBGB9YLcgdv6e36YCxsQ=
X-Proofpoint-GUID: 4Ik8M_6_74M41UIS9A11wOm0_hyGznDN
X-Authority-Analysis: v=2.4 cv=HKhWhYtv c=1 sm=1 tr=0 ts=6adf77ea cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=tIaaiuYHFHHTaTkjKuwA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260063

On Sun, Oct 25, 2026 at 4:17=E2=80=AFAM Hangxiang Ma
<hangxiang.ma@oss.qualcomm.com> wrote:
>
> Add the three Camera Control Interface (CCI) controllers present on the
> Kaanapali SoC. Each controller provides two I2C hosts used for camera
> sensor control, so define the controller nodes and their pinctrl states.
>
> The first bus has two CCI bus master pinouts:
> cci_i2c_sda0 =3D gpio109
> cci_i2c_scl0 =3D gpio110
>
> cci_i2c_sda1 =3D gpio111
> cci_i2c_scl1 =3D gpio112
>
> The second bus has two CCI bus master pinouts:
> cci_i2c_sda3 =3D gpio113
> cci_i2c_scl3 =3D gpio114
>
> cci_i2c_sda4 =3D gpio107
> cci_i2c_scl4 =3D gpio160
>
> The third bus has two CCI bus master pinouts:
> cci_i2c_sda5 =3D gpio108
> cci_i2c_scl5 =3D gpio149
>
> cci_i2c_sda6 =3D gpio115
> cci_i2c_scl6 =3D gpio116
>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 303 ++++++++++++++++++++++++++=
++++++
>  1 file changed, 303 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dt=
s/qcom/kaanapali.dtsi
> index 11df1c7c6e31..86dc1400a25e 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -3746,6 +3746,117 @@ camss_csiphy5_in_port: port@5 {
>                         };
>                 };
>
> +               cci0: cci@941b000 {
> +                       compatible =3D "qcom,kaanapali-cci", "qcom,msm899=
6-cci";
> +                       reg =3D <0x0 0x0941b000 0x0 0x1000>;
> +
> +                       interrupts =3D <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>=
;
> +
> +                       clocks =3D <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
> +                                <&camcc CAM_CC_CCI_0_CLK>;
> +                       clock-names =3D "ahb",
> +                                     "cci";
> +
> +                       power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +                       pinctrl-0 =3D <&cci0_i2c0_default &cci0_i2c1_defa=
ult>;
> +                       pinctrl-1 =3D <&cci0_i2c0_sleep &cci0_i2c1_sleep>=
;
> +                       pinctrl-names =3D "default", "sleep";
> +
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       status =3D "disabled";
> +
> +                       cci0_i2c0: i2c-bus@0 {
> +                               reg =3D <0>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +
> +                       cci0_i2c1: i2c-bus@1 {
> +                               reg =3D <1>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +               };
> +
> +               cci1: cci@941c000 {
> +                       compatible =3D "qcom,kaanapali-cci", "qcom,msm899=
6-cci";
> +                       reg =3D <0x0 0x0941c000 0x0 0x1000>;
> +
> +                       interrupts =3D <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>=
;
> +
> +                       clocks =3D <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
> +                                <&camcc CAM_CC_CCI_1_CLK>;
> +                       clock-names =3D "ahb",
> +                                     "cci";
> +
> +                       power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +                       pinctrl-0 =3D <&cci1_i2c0_default &cci1_i2c1_defa=
ult>;
> +                       pinctrl-1 =3D <&cci1_i2c0_sleep &cci1_i2c1_sleep>=
;
> +                       pinctrl-names =3D "default", "sleep";
> +
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       status =3D "disabled";
> +
> +                       cci1_i2c0: i2c-bus@0 {
> +                               reg =3D <0>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +
> +                       cci1_i2c1: i2c-bus@1 {
> +                               reg =3D <1>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +               };
> +
> +               cci2: cci@941d000 {
> +                       compatible =3D "qcom,kaanapali-cci", "qcom,msm899=
6-cci";
> +                       reg =3D <0x0 0x0941d000 0x0 0x1000>;
> +
> +                       interrupts =3D <GIC_SPI 428 IRQ_TYPE_EDGE_RISING>=
;
> +
> +                       clocks =3D <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
> +                                <&camcc CAM_CC_CCI_2_CLK>;
> +                       clock-names =3D "ahb",
> +                                     "cci";
> +
> +                       power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +                       pinctrl-0 =3D <&cci2_i2c0_default &cci2_i2c1_defa=
ult>;
> +                       pinctrl-1 =3D <&cci2_i2c0_sleep &cci2_i2c1_sleep>=
;
> +                       pinctrl-names =3D "default", "sleep";
> +
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       status =3D "disabled";
> +
> +                       cci2_i2c0: i2c-bus@0 {
> +                               reg =3D <0>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +
> +                       cci2_i2c1: i2c-bus@1 {
> +                               reg =3D <1>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +               };
> +
>                 csiphy0: phy@9523000 {
>                         compatible =3D "qcom,kaanapali-csi2-phy";
>                         reg =3D <0x0 0x09523000 0x0 0x2000>;
> @@ -4534,6 +4645,198 @@ tlmm: pinctrl@f100000 {
>                         #interrupt-cells =3D <2>;
>                         wakeup-parent =3D <&pdc>;
>
> +                       cci0_i2c0_default: cci0-i2c0-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio110";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio109";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci0_i2c0_sleep: cci0-i2c0-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio110";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio109";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };

Why do we have a sleep state if it's identical to the default/active state?
Do you want gpio with pull instead?


> +                       };
> +
> +                       cci0_i2c1_default: cci0-i2c1-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio112";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio111";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci0_i2c1_sleep: cci0-i2c1-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio112";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio111";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci1_i2c0_default: cci1-i2c0-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio114";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio113";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci1_i2c0_sleep: cci1-i2c0-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio114";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio113";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci1_i2c1_default: cci1-i2c1-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio160";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio107";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci1_i2c1_sleep: cci1-i2c1-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio160";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio107";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci2_i2c0_default: cci2-i2c0-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio149";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio108";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci2_i2c0_sleep: cci2-i2c0-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio149";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio108";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci2_i2c1_default: cci2-i2c1-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio116";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio115";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci2_i2c1_sleep: cci2-i2c1-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio116";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio115";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
>                         hub_i2c0_data_clk: hub-i2c0-data-clk-state {
>                                 /* SDA, SCL */
>                                 pins =3D "gpio66", "gpio67";
>
> --
> 2.34.1
>
