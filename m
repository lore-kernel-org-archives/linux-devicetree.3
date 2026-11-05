Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793880302;
	b=nfGR/9J3+GLm44V0QxO27pfzbIRGQ8Qt5yYG0e/+3M0ItXAKZIGHOFMQYfaF8kmreO+J
	 kWag1ZFVl3gxlrZN6LivbOgOQ9GWMwlohywN4eImHQWwXhfXr/FE0EI7QLv2GzqY7YGzw
	 kYiXM/FWBEFOWXLmhNV5WgFNthcAo6Bf6smGJQcgypIWfPiori+FQyUOWfs1lu3YjzuEV
	 QY5gYNCWZHhUa8QCh+dztVw8XrSLpo7dInbBie7iPoOJPIIwE2lFi/STdETz/ruC533G2
	 fkCWdHlOBew39RpeiLooE1z+a/9PaPDSCIG61QYVA57c7RnMbxazqsD9PXQkegBpRJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880302;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LnE+buvxuYs3CT/Hxc5FTa6YKVygIYUeXUvvlay6o60=;
	b=A7z1a1+qydTu5hAZYCYCX5InF2jZ3F24Oo5NPK00ZSl9MUbAgA5BC812ssJPgEkXqkfS
	 aSBrYo5afegFlFp2SsXlg/I7x4pHjlBhBwYOzm9J+AcQiotrxhDukRntBlM3qnJV7Dw8S
	 DQ3Gz7JKt8WTmgsvaTCz/aK4gqXUn30sa18YbmizHpQa6k1t05y6ep9bykB9YGmz/JBe2
	 vIbT6NRLBA1dds+NOAZUzckb4UZa5ssfV75jnI4wiIWQ5QWxVWaBfBYsCxtegquKw/nR1
	 MRNEMQ7IDQFKPzdxTtJzmtJw+9/O734sV2Tib2u6gQELRgnAADSGd/U/iAbV2BMxHJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E4jv8heE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KqeK6u4b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D453E606A326
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 12:05:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D453E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E4jv8heE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KqeK6u4b
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5Ahxlg1582975
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 12:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LnE+buvxuYs3CT/Hxc5FTa6YKVygIYUeXUvvlay6o60=; b=E4jv8heEUFra4Irx
	2LpEY24X//cT4epKu4S0xpuQ2kL7vX7QChcNDd4SpgbJqeNdKyWI70uhpcK45GgG
	7r1F2PjO0bCo3sGRvM2Ut8K6CWSyOknJGwbtZC407BmD6L7i7MnrYy6NZmLat0WD
	QRTvUQdd9Gapuv5R+XW9TnUduCh21r3t27gSSIU4wVkRE1axYYJyLPeuGMScyIBI
	5QYoR9oIKL8OT8Rmto3DfNH2mBe8t28zgYst0BfQuD0ZbCcOUtKESMh2qRHcTeXQ
	civAjC1WRh2sDqqDhLd3dPi9vwXJlWYsSiJCLocxz3O0p/KlAtGjgAAeHTXMsxjQ
	gGO+3A==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrraarb4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 12:05:01 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-54213290993so1228364b6e.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 04:05:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793880300; cv=none;
        d=google.com; s=arc-20260327;
        b=pwXtvT3474VL29T6tsJdQUgi1rXg1hnc9dpDKKlpkGiixWTT4erU2at2vtLBh0/6YQ
         VucPgk8eNsRjYQnmMUh9E3yR3/1XKvSZzf7D6YN6xQXN/R9MJi9uvxtP/x8UrGkev/2U
         wewiyG6citqloVdrJalKz+khLHaLLK6Q96tDiX5oxuuBrlDM9ARbWY3Qcbi24+Sz5sr7
         4UtiK4mVCT5Cw529d2eTVFf3yF7cXt6s1oaRSIpGS65uprNrFVaKpeThGjxG8zbrGtBB
         N0QoxjOIMQ/J7TyXH839qerxEWWI087cOWBfyezxqcgsnwV7JKhkPgiyV8x/84sxfq7D
         X1+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LnE+buvxuYs3CT/Hxc5FTa6YKVygIYUeXUvvlay6o60=;
        fh=Cxr0dcL1q8N4z7AIFUUfuBXTn9wTaf4DRuQGA+nGN5g=;
        b=tCf5RwAwNd3c8yR0JRAF+S8lDpnG3SiZYJhOGAloaYP2RS//+VnV19Spkr/oSI0CEu
         b5Hoy8bBet7qQ7IRMJka3KFCD3OluB21cSpbXhkMoqhNBEZ04uDm5yCpA+OFt3+6IkRT
         QvwH2G+lsMfOXwuXHKg0++NBboJgWnkWqq47VNnAxQiJQ+JKWgzaaI3XqeAHnTVkWMfG
         F1X+NNDpJCiShS3HgFdRw6HYE/5kn3V4pwP2A1Ep30GmZEPLEN2tIt0UvHuEeVwx4Apk
         ksqkp1cm9N1kWwn61xSaHe7FXTxk5Cs4hNu5G3rXUttACQhwbJBDtLLQW3EFNobTkKlS
         hj+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793880300; x=1794485100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LnE+buvxuYs3CT/Hxc5FTa6YKVygIYUeXUvvlay6o60=;
        b=KqeK6u4b9wES1D9XLtYAwi1N7O1h1xQ8YegbJvwQ956ZQlvjfeUOtxAclXTs5RzNRl
         /hv8h2wqXL4bj/PX9Hupo11wrGhR3xIQZu8E6br/TYREXTH+k3ooaAeWRfMdRexcUQC5
         2A5zjP5QF2QtX+oQpDBJD7WLE2x4zGHXodmkPOTuOR99JbhPKD9NrRshremKiJKukDee
         flQmdIczu7mCQwlcyUK89ruBAp+VulEK82a9oNG2j2Kt62IbIxELcHvd4vU/n28qRy80
         BLx5jJoX6jFIxr3rtJXV4Q8EQaXqlfr8iGpuFl84CVmD8Xuu8RjJN0wUrTSoD1iWLARU
         40pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880300; x=1794485100;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LnE+buvxuYs3CT/Hxc5FTa6YKVygIYUeXUvvlay6o60=;
        b=EsT5M8yWxsPr3KsxtXv0MlvekSIzgZck1TT6jfNgP2DYRBZOI2y2g5TXikxaoip6zC
         C0a0GFp3g132XKcJPw4IhIaajIihgz+c7LQbR7mOXpb2WcARkiP3NFzIA4unxtn1lTjC
         uvff19a9bfTP6T+SoyoIQSCYCa5QrH6Q28Q92oVW8MLn+ChyrE6Q1jsnuXkPKFAhX4Bx
         7OAedvb0dO5SazLlu5fxgG3uq27Pm6c1pf2B8O28vbhh6urWRoM3hhA2NUt4j2KrRYY0
         4ffiByOLiFYfO4Txmkfe31BXffo8W6HBPt85sQqPxMdZYP86Zk4kjMN1fcc70HqIqRIV
         Qv1Q==
X-Forwarded-Encrypted: i=1; AKwUvBz7s88+lPTQ1MsZIPf79MVBn7bkSAvpLhvqP+Gt09E+PLbEulkvMZezjLySoZERNRcFKwWOmMA8oQ0d@vger.kernel.org
X-Gm-Message-State: APuU4Z9VwCwWo873c0+LMnZGmiEUGMV71U0IHtAUSI9sYy6P0I+rqSg8
	SS0WPzb9on27ZrkHT4aSctefUzEfsi/dInEjWit8lvP5xb5vEjbaX/1X1eP6rXtmEMAzAOaXla3
	yCuMzoColfOXRgxFatrIaQyF1m0DkpaeHgE0hR5nKQn5LRTyyIpMEqhz7PqNneid2e6XLYvVuBy
	0m/TCD2ctqTgAxFca3VsSyVVu5j5Tbdy8LfiijpVo=
X-Gm-Gg: AYBFou3OCUneem+mjS4+PBqBViwDoAwxanBFMCMiyEGTVBSjMLtOkY0qHTMOLVaJPm2
	GlZmrvivJDtT8cNAB6GEwIfaGGfjq0M+IM2FBs4kyRtPuqeE//5MmOdfkyah62A4cVv39vtxWI0
	zxFVWas6UdxzvBcabcevzM25oG8gLyAGBmm2sX0EHkmFZVXmdqD8UN98nY//scZbvf9gFEtsvHs
	SZnKgVNPMy3WfgBh8cAXBNefbUea5SawwyDKGfDiB5E49XZAZR0oo0F/SevRZ0G5mzmEic2csg=
X-Received: by 2002:a05:6808:6f8d:b0:4eb:d5da:bf21 with SMTP id 5614622812f47-5640e09d416mr12461373b6e.65.1793880300280;
        Thu, 05 Nov 2026 04:05:00 -0800 (PST)
X-Received: by 2002:a05:6808:6f8d:b0:4eb:d5da:bf21 with SMTP id
 5614622812f47-5640e09d416mr12461323b6e.65.1793880299813; Thu, 05 Nov 2026
 04:04:59 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261102-glymur_camss-v1-1-fcb619fc7319@oss.qualcomm.com>
 <20261104-real-nebulous-ostrich-017e92@quoll> <72064a9a-1b2e-4c24-99e2-2cc15a8dd7f1@oss.qualcomm.com>
 <a2d3190f-bfd1-4548-aba9-a186cfea878b@kernel.org> <c5af7192-c923-4fbc-bbfc-7f03e310fddb@oss.qualcomm.com>
 <fc9acaf2-f214-434e-bbe1-88e8e1af7683@kernel.org> <539842db-c672-4549-b861-4a6f3be47556@oss.qualcomm.com>
 <d586b7b3-675d-48a8-b0d4-564e571ef69f@kernel.org> <CAFEp6-25QrLAF=-KgGJ-rC9pDpGa2YgoQAMKxU-FoByu2CJpMw@mail.gmail.com>
 <1db9bf48-01d8-44fe-8dd2-7a3c84ecc556@kernel.org>
In-Reply-To: <1db9bf48-01d8-44fe-8dd2-7a3c84ecc556@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 13:04:47 +0100
X-Gm-Features: AclHuK9rhmN1T5uyjSFVpg_P5DvGeB0710y7iKzLARDbFg21rI25jjD--irSqx8
Message-ID: <CAFEp6-1fSPP41cVFmu8=0z2xibDpHuH5Lxrw7W_rvnt+Fw9EpA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,glymur-camss: Use CSIPHY
 indices for ports
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0OCBTYWx0ZWRfXzTJTLNri/8+l
 +F0OGq1TfRLHt1Db43R0YPjGI8BDRil+a9FytN2Mvq/FZe5EebkwsLr4tVT0jD5/mkltYHshzU7
 lLM8CMLCcVZollHef3zKZP3Area/dFg=
X-Proofpoint-ORIG-GUID: OcukhLSgBxlWcgnkZKWvd5U2A8mNnPt6
X-Authority-Analysis: v=2.4 cv=U54Hnuru c=1 sm=1 tr=0 ts=6aec70ed cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=gMKTrDL_i4-E7wsZRbUA:9
 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0OCBTYWx0ZWRfX4+XOV6WmukTR
 ckyulN8GOnTKdDXvKsl63dz/KbYNANhYT0Q0n2miWnFXbtjZ5FaCZ680AcPgFDB8k5iQ/AMy0g1
 b/5T4zJ1mrCwenoZQkNttsEQ/m/8euPbX8PFuzs3BEof9TD3zhuPYVp4KCLQAlrn4M0fp5FzFC3
 i10tnKLeEoQto2gALyW0i8PPNHn5DHGrE95mDepsp/MlXC4fiPf79Ptd/6jssEyphE0w9ON/r6I
 9mDTnXYAAAQyt25/GT0tJJ4vWwvstIP4v1vAQCafNxrrpr51DRzFdV/Lv3O3DuNqQ+AqMXly0Uf
 r91CtNmhcPbcOKXHYOl2wB0s7e6lA84F2st3RU25TY3TG9ZQjaZ6wuHBDBnRwRMmW/VSPiD9snz
 Bl+2RNmqdYxQ2pSntrXfiUUPMfNhfiQVXmonFT7TLIkOzd249jNeEYoc0VvjWiM+fUtHvwpsp/Z
 fj5MYJt06BVpo6+G3+A==
X-Proofpoint-GUID: OcukhLSgBxlWcgnkZKWvd5U2A8mNnPt6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050048

On Thu, Nov 5, 2026 at 11:45=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 05/11/2026 10:53, Loic Poulain wrote:
> > So some chipsets share the same IP blocks, with some block/phy
> > instances disabled. As a result, we need to decide whether we're
> > numbering based on active instances or on the actual hardware instance
> > index/offset. If we use active-instance numbering, then yes, it should
> > be @2 (CSIPHY4 being the third active instance). Alternatively, if the
> > port numbering is intended to reflect the hardware instance offset,
> > matching the register prop, then @4 would be more appropriate. It also
> > has the advantage of directly identifying the underlying hardware
> > instance, without requiring any additional driver-side mapping. In any
> > case, @3 is incorrect.
> >
> > That said, since the bindings have already been merged in its current
> > form, we'll need to preserve backward compatibility when addressing
> > this.
>
> This is the input port to camss, so how is it called in camss, not the
> csi phy?

The CSIPHYs are connected to the CAMSS input ports, which can then be
multiplexed and routed to different CSIDs. The mux identifies its PHY
inputs using the hardware PHY IDs, so the CSIPHY4 is identified as the
CAMSS PHY4 input. In this configuration, PHY2 and PHY3 inputs are not
connected.

Regards,
Loic
