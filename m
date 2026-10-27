Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793092040;
	b=42+wDOwsGo0efWIUE+u5CnCYyGmQN3hvWBnSaUQRZc/4TlqnwQUVtmokpMdeFke9g2NL
	 8UdlUkw2D0gIER/vgFZ/U8LJ8FsgpHg0j6tWKtg2H5MODZtZLgh995jL/6WhKsOix36zs
	 SpdnjlXv9Rt1518o2SUAsDzE+GQkIvVKQYqlXBJqSqZWdMy4C3MPdT1gLLtVESFsQxEEF
	 M1jDKutm+uhgo5KsdHdHfoL5pra1YQCpF2h9dtkl78tBGyx9yi7rkMtqs/kJaSpkXUCFm
	 xATleVTXk9Jqijl/qQkntTLZEK11moEIJHhXMLELPAj/sk4vJqTIzX+xbXuFtDEY10g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793092040;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uAERb0wCRzrZjHGtCvmsHn8DoN5onKXicoeOK4A7gS0=;
	b=DGKQZZ39BFkb1wcUdycXRBN4FTDesr9yzPbUxai6LIE7cAK6hVJp6Ss/meUHmDz6Cwxn
	 Ew60QTxiBkxau0xX/b56vM/Q7v/uJ/g77qR+taNJeJAPUTTTy5khGXkEf+lT0pdFpU6DY
	 t7Q2G2QlEupkSLDgCeQiQTZAzS5DCM4w8edgKz3PfkVGJ55YwRkwzGFudShriDxdanNH0
	 gQHYRH/b0HDWJ+aZKp/EdI9A+3Q6UsrUFaLik17WbAp5ELPw7WtlblSbkNRzMGlOa4EsY
	 BoJcMVYB+4CxMAYk+O75NxUEytM2VeA4UBzDp+akfnla5FDF9kUk10Bbvd515Rri/fg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DoHF7wLV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eYOrq+7H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CAE606A31D
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 09:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14CAE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DoHF7wLV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eYOrq+7H
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R8fq6A2259109
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 09:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uAERb0wCRzrZjHGtCvmsHn8DoN5onKXicoeOK4A7gS0=; b=DoHF7wLVKvgeaB4x
	94v907y1NKuHNyj5LP0tgeIPXsWvN4688aDZ3IzEpZGG+ct2XpFLOIjcKn2pKaSa
	2QI4+v7jjUvd04BlacVR+j3m6t4dc6N0etIN+mCOokej3Fvg8llgjlpD2Ri24h1g
	VqGMyGPpVVI9WBDEqy9I+NNLkFNPGp+0MnKc16fhBAqUPJJovdWle361OwjlHgzH
	2GItLDr44rwPEWAGq+bgoZ8ndfDnlb280rsRWEmuv24Xk++of+XCPzYXCAv0FQrU
	6aPNRGQayYq+h/4XCn/sjeHA173s0dnRsBqJrWsUL33PJaPT32JQ7yB5/vKf3RK4
	3syB+w==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqw209q0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 09:07:17 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4c467e19391so6947387b6e.3
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 02:07:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793092037; cv=none;
        d=google.com; s=arc-20260327;
        b=HvSJHxTU2bZHkhrkLyafOUVSUOmyy7gC/Y8q3l2VSAp1gGE+mXjeDequkkaWJl8zRS
         1KtXFv2SLkygxPPCtxge0HQGNKwh85lcor7aDLuHSZ34WoFtWF+jjRFwFLkARHeh6PYx
         QUg/AFS7vwayg81e50MPzprUalPQ4aleH/WEsiDY2Lp2B28kVZ+SNgLXfejyFB7cKi6r
         Fe+oQ3SkidKg1Rgaj57N2KLwBgbwb+h/7cFP8q6EA2XXctKx2RAN2GYRGtJOoKnYcDbe
         r96XgTtQ3zD11uygeEPypIFHzlE6zTHqhixyjz05qVVa/CTxRSDS0M3z1KTP5lMAdjsK
         LDYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uAERb0wCRzrZjHGtCvmsHn8DoN5onKXicoeOK4A7gS0=;
        fh=JbAaghmeA38ZCV8b01BIRgzQP8em8KK/y7Im6PtQU7s=;
        b=Hwf8MGFHqwBJJQyxwsFHlEjO3cEKuDQUS7bomVpTh1E9HbyymZOUIO39jbGlT3lXbC
         dXfubJgLuLzHYHUL+s+b28x42MGO0qjzHsj4klQ65HPXde3kum2tZxCiA1tYrIrEJ7Wu
         kTuCYo2ULWb1kEZqQQ0+h8HfMGNDazKmwLzX3tU0LCG6ml/ZBiUigi7x5UUSBqmlxGUW
         QqbnpTWMwhXB6yKHJHWAWC2jKQkCeEDeVcecZNC0L6ViMsKJLilDEEtprNK6xVHuteQs
         5WuvQC+RQ/h89mgxSA+SRxzz99a+JogYLTaWyNZz9ZOmJz9roKHTDiIs3scnCE2nbjgQ
         JTjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793092037; x=1793696837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uAERb0wCRzrZjHGtCvmsHn8DoN5onKXicoeOK4A7gS0=;
        b=eYOrq+7HvAtlj/yeN4GZ+QnIBbnS0MyafSPJd3Cis7J2xMIhOjWrK/ZdmKm7TzOnmP
         gDbOSo9TOY8ye2F6tJmvIMk7RNBaEIelXiIDyf9DmkdDlw+wNL4RMwYr57GgnD0+wPyO
         yXqkYyhlIEtQLB0a2Pke1HWtx2QCQswfF/URVG6EwhB5s9tkIcLKmFqDjcnCX7HmF64b
         4L0fbtRsiooPvKrXi56TcJ/9nSsR4k7oL7MCCGydbE/1pZFPOic186A27u05TSlb3Iz1
         fMM3nOoMSXHA4Abzk7M41ZtoQQnUau4a//eYzAE+VMDrACtAX+S+WAt2swK19jxHSIqd
         7x3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092037; x=1793696837;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uAERb0wCRzrZjHGtCvmsHn8DoN5onKXicoeOK4A7gS0=;
        b=eloxVkv9R/RmRN9olEEPfxv0I4i+oLFjF6Or4KuoF7MPqR6Dcz2RKRXBltpCAjzKUc
         IlP7jaH7cb8Sgtk2Jg+pufyHjiD3BwOBwUzxRZIv7Sk3NBxkkDfR86+ecJuh1s19PkYE
         QwKdnA2JCE47if/avDA2MlYTTtoT4AEFECdtiEOpUYGr+FRqUGQhYTVb1fDG21a0EOjg
         Y5VcFo1pbNWD7ohy40rJquGnLQrA4DwRUu5H+8nJCY3o50bcqwp6VWXAgV8WtLBrTnOP
         5C7eIlLEjwseTE/ZCVo49sARcBWL83dIS89dGmxXdQqk05tqlhzjkn0LcfoL9k596Dwa
         hzwA==
X-Forwarded-Encrypted: i=1; AKwUvByBTIM59A10+BLNjrID6qrOgzJQ2bRbRRwO6RGoymJiUSSWx0IKzuo/7IHAP9GvtJzVcib8h6gqPPyv@vger.kernel.org
X-Gm-Message-State: AFq9FYIwI0hWNKUSCyEi5ybv0vKNFlx2zNAoSASUIxHyDmecIC/Sve+7
	huafBf3MpLmmKfA5NLs7CEbAgC01wjl//YPW1TKCtGeqGKSjpDfqOjyYw5LAWd6MWgL2GPbiGsg
	74B2BOXfuVplvJoI0mUsSzfm4DSbBuqVGO9ovIbogPRlCplcLRkLKdlJ8rrhQzBrSrZyD3qQnVk
	RHJj0wn6vm34fsPwopiiUAPifI4SuEB1UK6wYI8C0=
X-Gm-Gg: AYBFou0+AUWdCfySk3T+kaa02zD8FxTd8Ou1Ojeg0GMDdzfXFU27P+dml51/HjiiJaK
	iFljYHQaPrNA4wYPGrneezJi8wEVK2kQXkg6ElEgHmv3Hduw4h4w1oP0gc6hWFlqTW58i2/tnV5
	x23fWFWS8ya+fVlBfGH6/frHHdnMZA/AD8mzjEKdprVIQctlN017R0ae3eczkzZv1dwArmdBDfy
	hWLWN+PmSzj1uVD73aFMiAKVcwDNgPppF1NeswdcRJtwbpXt4EC4+PY6VAFraYGFZKAn3F3R1e5
	ZtXiYJVAq+Jqdxap3homyp82OCzj
X-Received: by 2002:a05:6808:c40a:b0:4f5:c4b9:dbfa with SMTP id 5614622812f47-55c0030f23amr6378145b6e.48.1793092037092;
        Tue, 27 Oct 2026 02:07:17 -0700 (PDT)
X-Received: by 2002:a05:6808:c40a:b0:4f5:c4b9:dbfa with SMTP id
 5614622812f47-55c0030f23amr6378123b6e.48.1793092036653; Tue, 27 Oct 2026
 02:07:16 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023163057.775917-1-vz@kernel.org> <20261023163057.775917-5-vz@kernel.org>
 <CAFEp6-03Kqxya74Cd+hgueZ0D4xAcYNOx_R1sNqdMu2JrMBynw@mail.gmail.com> <378094fb-5f7f-42c6-a91f-158e2083a6cb@kernel.org>
In-Reply-To: <378094fb-5f7f-42c6-a91f-158e2083a6cb@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 10:07:04 +0100
X-Gm-Features: AclHuK-ho7ZrN5NtRv0BoexmU7PuvWaCrHKnlKw9dHT5HTP4ffUu9Nkqus-o-ew
Message-ID: <CAFEp6-3XTotgkOKRACGLT91wUw30CgFB=44RtHnXfA6cOF7bVA@mail.gmail.com>
Subject: Re: [PATCH 4/7] arm64: dts: qcom: sm8450: Add CAMSS device tree node
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, "Bryan O'Donoghue" <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzNiBTYWx0ZWRfX6uJDKm+FGi/M
 UqmG/l6kvX7/o6deIgooz9ehKQSI7/GvbFFpMIPtKb/Ec0qSJbAMKaeuqhOSmV8/x8OWu73b3ed
 Q6caRx02VI4Ck2hO8Hod1E7CdeURRrrmPf0FZbDBLjdgayX+aO+HRpgS7tfeYNBW2uSICEKaiZq
 rj9DNINQarHl/Xcg713zcDr2BfppvV2L8OWhU9O1lK+n5M07HQUPnXc99LjiuMlyAw3P3EOPLtL
 RWkM8NXfbJScoDcx52qb+O3+YP7DY1qgvkYQCMkNP3QhmBDtCMPWAfs2xJMQ5xE988eOBwp00Ru
 G/gIAQqTHEL8wL+Adw4OO/16FOrgmWNdzJv1QdFtBYjY5bPHCPplGNYpQea85ZnTz5eJu47+/Au
 uO5lZA1J063zveKXHovNmEXG3QEeCZHLVC2oTjFFfDjOySt43WQDshQ5iI8FmpTuSBwAcsAZIAj
 YDIpRP6QO9zmq2gJmZg==
X-Proofpoint-GUID: OdSSO2leQ0RtoUZsp-nLMdF2Kz7A8qV8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzNiBTYWx0ZWRfX80zbyUHepPmJ
 Oh11m3CVs4Ayu9QdmdKEkKuWeuDX8yUNaCjFtXm64+EZGaRsFvvV7SyDq0DIg/GtmWPnZ7R/OYl
 9UDJ/eKJN9Bi6y4V8CmXz2B6uGc1IkQ=
X-Authority-Analysis: v=2.4 cv=PsYG/AM3 c=1 sm=1 tr=0 ts=6ae069c5 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=TiL9E1vQkKM8ncXhiTsA:9
 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-ORIG-GUID: OdSSO2leQ0RtoUZsp-nLMdF2Kz7A8qV8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270036

On Mon, Oct 26, 2026 at 11:39=E2=80=AFPM Vladimir Zapolskiy <vz@kernel.org>=
 wrote:
>
> Hi Loic.
>
> On 10/26/26 18:32, Loic Poulain wrote:
> > On Fri, Oct 23, 2026 at 6:31=E2=80=AFPM Vladimir Zapolskiy <vz@kernel.o=
rg> wrote:
> >>
> >> Add Qualcomm Waipio CAMSS device tree node to the platform dtsi file,
> >> the CAMSS input ports are connected to output ports of CSIPHY devices.
> >>
> >> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> >> ---
> >>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 167 +++++++++++++++++++++++++=
++
> >>   1 file changed, 167 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dt=
s/qcom/sm8450.dtsi
> >> index babf1a4196a1..7f5b0501a23e 100644
> >> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> >> @@ -3310,6 +3310,167 @@ cci1_i2c1: i2c-bus@1 {
> >>                          };
> >>                  };
> >>
> >> +               camss: isp@acb6000 {
> >> +                       compatible =3D "qcom,waipio-camss";
> >> +                       reg =3D <0 0xacb6000 0 0x1000>,
> >> +                             <0 0xacb7000 0 0x1000>,
> >> +                             <0 0xacb9000 0 0x1000>,
> >> +                             <0 0xacbb000 0 0x1000>,
> >> +                             <0 0xacc6000 0 0x1000>,
> >> +                             <0 0xacca000 0 0x1000>,
> >> +                             <0 0xacf6000 0 0x1000>,
> >> +                             <0 0xacf7000 0 0x1000>,
> >> +                             <0 0xacf8000 0 0x1000>,
> >> +                             <0 0xac62000 0 0x3000>,
> >> +                             <0 0xac71000 0 0x3000>,
> >> +                             <0 0xac80000 0 0x3000>,
> >> +                             <0 0xacc7000 0 0x2000>,
> >> +                             <0 0xaccb000 0 0x2000>;
> >> +                       reg-names =3D "csid_wrapper",
> >> +                                   "csid0",
> >> +                                   "csid1",
> >> +                                   "csid2",
> >> +                                   "csid_lite0",
> >> +                                   "csid_lite1",
> >> +                                   "tpg0",
> >> +                                   "tpg1",
> >> +                                   "tpg2",
> >> +                                   "vfe0",
> >> +                                   "vfe1",
> >> +                                   "vfe2",
> >> +                                   "vfe_lite0",
> >> +                                   "vfe_lite1";
> >
> > Is there a camss "top" register to describe here? e.g. to retrieve the
> > CAMSS hardware version.
>
> I'm not aware of anything like that. What is "CAMSS hardware version"?
>
> CAMSS embraces various blocks, there are CSID and VFE, full and lite
> IPs, and all these components do export their versions individually.

I mean, CAMSS usually has a top-level register block (often top or
cpas_top) that contains the Titan/Spectra version information, along
with various global configuration and mux registers.
In particular, exposing this block could be useful for reporting the
Spectra version to userspace, for example through libcamera.

Moreover, if the goal is to describe the CAMSS hardware exhaustively
in DT, this block should probably be represented as well. Whether it
belongs in this specific binding is open for discussion, but my
inclination is that it does.


>
> >> +                       clocks =3D <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> >> +                                <&camcc CAM_CC_CORE_AHB_CLK>,
> >> +                                <&camcc CAM_CC_CPAS_AHB_CLK>,
> >> +                                <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
> >> +                                <&camcc CAM_CC_CPAS_IFE_0_CLK>,
> >> +                                <&camcc CAM_CC_CPAS_IFE_1_CLK>,
> >> +                                <&camcc CAM_CC_CPAS_IFE_2_CLK>,
> >> +                                <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
> >> +                                <&camcc CAM_CC_CSID_CLK>,
> >> +                                <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
> >> +                                <&gcc GCC_CAMERA_HF_AXI_CLK>,
> >> +                                <&camcc CAM_CC_IFE_0_CLK>,
> >> +                                <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
> >> +                                <&camcc CAM_CC_IFE_1_CLK>,
> >> +                                <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
> >> +                                <&camcc CAM_CC_IFE_2_CLK>,
> >> +                                <&camcc CAM_CC_IFE_2_FAST_AHB_CLK>,
> >> +                                <&camcc CAM_CC_IFE_LITE_CLK>,
> >> +                                <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> >> +                                <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> >> +                                <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> >> +                       clock-names =3D "camnoc_axi",
> >> +                                     "core_ahb",
> >> +                                     "cpas_ahb",
> >> +                                     "cpas_fast_ahb",
> >> +                                     "cpas_vfe0",
> >> +                                     "cpas_vfe1",
> >> +                                     "cpas_vfe2",
> >> +                                     "cpas_vfe_lite",
> >> +                                     "csid",
> >> +                                     "csiphy_rx",
> >> +                                     "gcc_hf_axi",
> >> +                                     "vfe0",
> >> +                                     "vfe0_fast_ahb",
> >> +                                     "vfe1",
> >> +                                     "vfe1_fast_ahb",
> >> +                                     "vfe2",
> >> +                                     "vfe2_fast_ahb",
> >> +                                     "vfe_lite",
> >> +                                     "vfe_lite_ahb",
> >> +                                     "vfe_lite_cphy_rx",
> >> +                                     "vfe_lite_csid";
> >> +                       interrupts =3D <GIC_SPI 464 IRQ_TYPE_EDGE_RISI=
NG>,
> >> +                                    <GIC_SPI 466 IRQ_TYPE_EDGE_RISING=
>,
> >> +                                    <GIC_SPI 640 IRQ_TYPE_EDGE_RISING=
>,
> >> +                                    <GIC_SPI 468 IRQ_TYPE_EDGE_RISING=
>,
> >> +                                    <GIC_SPI 359 IRQ_TYPE_EDGE_RISING=
>,
> >> +                                    <GIC_SPI 465 IRQ_TYPE_EDGE_RISING=
>,
> >> +                                    <GIC_SPI 467 IRQ_TYPE_EDGE_RISING=
>,
> >> +                                    <GIC_SPI 641 IRQ_TYPE_EDGE_RISING=
>,
> >> +                                    <GIC_SPI 469 IRQ_TYPE_EDGE_RISING=
>,
> >> +                                    <GIC_SPI 360 IRQ_TYPE_EDGE_RISING=
>;
> >> +                       interrupt-names =3D "csid0",
> >> +                                         "csid1",
> >> +                                         "csid2",
> >> +                                         "csid_lite0",
> >> +                                         "csid_lite1",
> >> +                                         "vfe0",
> >> +                                         "vfe1",
> >> +                                         "vfe2",
> >> +                                         "vfe_lite0",
> >> +                                         "vfe_lite1";
> >> +                       interconnects =3D <&gem_noc MASTER_APPSS_PROC =
0 &config_noc SLAVE_CAMERA_CFG 0>,
> >> +                                       <&mmss_noc MASTER_CAMNOC_HF 0 =
&mc_virt SLAVE_EBI1 0>;
> >> +                       interconnect-names =3D "ahb",
> >> +                                            "hf_mnoc";
> >> +                       iommus =3D <&apps_smmu 0x800 0x460>;
> >> +                       power-domains =3D <&camcc IFE_0_GDSC>,
> >> +                                       <&camcc IFE_1_GDSC>,
> >> +                                       <&camcc IFE_2_GDSC>,
> >> +                                       <&camcc TITAN_TOP_GDSC>;
> >> +                       power-domain-names =3D "ife0",
> >> +                                            "ife1",
> >> +                                            "ife2",
> >> +                                            "top";
> >> +                       status =3D "disabled";
> >> +
> >> +                       ports {
> >> +                               #address-cells =3D <1>;
> >> +                               #size-cells =3D <0>;
> >> +
> >> +                               port@0 {
> >> +                                       reg =3D <0>;
> >> +
> >> +                                       camss_csiphy0_inep: endpoint {
> >> +                                               remote-endpoint =3D <&=
csiphy0_out_ep>;
> >> +                                       };
> >> +                               };
> >> +
> >> +                               port@1 {
> >> +                                       reg =3D <1>;
> >> +
> >> +                                       camss_csiphy1_inep: endpoint {
> >> +                                               remote-endpoint =3D <&=
csiphy1_out_ep>;
> >> +                                       };
> >> +                               };
> >> +
> >> +                               port@2 {
> >> +                                       reg =3D <2>;
> >> +
> >> +                                       camss_csiphy2_inep: endpoint {
> >> +                                               remote-endpoint =3D <&=
csiphy2_out_ep>;
> >> +                                       };
> >> +                               };
> >> +
> >> +                               port@3 {
> >> +                                       reg =3D <3>;
> >> +
> >> +                                       camss_csiphy3_inep: endpoint {
> >> +                                               remote-endpoint =3D <&=
csiphy3_out_ep>;
> >> +                                       };
> >> +                               };
> >> +
> >> +                               port@4 {
> >> +                                       reg =3D <4>;
> >> +
> >> +                                       camss_csiphy4_inep: endpoint {
> >> +                                               remote-endpoint =3D <&=
csiphy4_out_ep>;
> >> +                                       };
> >> +                               };
> >> +
> >> +                               port@5 {
> >> +                                       reg =3D <5>;
> >> +
> >> +                                       camss_csiphy5_inep: endpoint {
> >> +                                               remote-endpoint =3D <&=
csiphy5_out_ep>;
> >> +                                       };
> >> +                               };
> >> +                       };
> >> +               };
> >> +
> >>                  csiphy0: phy@ace4000 {
> >>                          compatible =3D "qcom,waipio-csi2-phy", "qcom,=
x1e80100-csi2-phy";
> >>                          reg =3D <0 0x0ace4000 0 0x2000>;
> >> @@ -3349,6 +3510,7 @@ port@1 {
> >>                                          reg =3D <1>;
> >>
> >>                                          csiphy0_out_ep: endpoint {
> >> +                                               remote-endpoint =3D <&=
camss_csiphy0_inep>;
> >>                                          };
> >>                                  };
> >>                          };
> >> @@ -3393,6 +3555,7 @@ port@1 {
> >>                                          reg =3D <1>;
> >>
> >>                                          csiphy1_out_ep: endpoint {
> >> +                                               remote-endpoint =3D <&=
camss_csiphy1_inep>;
> >>                                          };
> >>                                  };
> >>                          };
> >> @@ -3437,6 +3600,7 @@ port@1 {
> >>                                          reg =3D <1>;
> >>
> >>                                          csiphy2_out_ep: endpoint {
> >> +                                               remote-endpoint =3D <&=
camss_csiphy2_inep>;
> >>                                          };
> >>                                  };
> >>                          };
> >> @@ -3481,6 +3645,7 @@ port@1 {
> >>                                          reg =3D <1>;
> >>
> >>                                          csiphy3_out_ep: endpoint {
> >> +                                               remote-endpoint =3D <&=
camss_csiphy3_inep>;
> >>                                          };
> >>                                  };
> >>                          };
> >> @@ -3525,6 +3690,7 @@ port@1 {
> >>                                          reg =3D <1>;
> >>
> >>                                          csiphy4_out_ep: endpoint {
> >> +                                               remote-endpoint =3D <&=
camss_csiphy4_inep>;
> >>                                          };
> >>                                  };
> >>                          };
> >> @@ -3569,6 +3735,7 @@ port@1 {
> >>                                          reg =3D <1>;
> >>
> >>                                          csiphy5_out_ep: endpoint {
> >> +                                               remote-endpoint =3D <&=
camss_csiphy5_inep>;
> >>                                          };
> >>                                  };
> >>                          };
> >> --
> >> 2.53.0
> >>
>
> --
> Best wishes,
> Vladimir
