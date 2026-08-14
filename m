Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7003C37A82C
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 21:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786742794; cv=pass; b=rdX3Y9WO1ulPTuA4SiDmm/AdhoTGkxHfEYt4Yz3mPriTi6FxZtrLWaH+Ditn5xbPbB/LgMtNmM3vtrBY+hlB0hD4zbv7Juhq4It9S4hvqq3lsiR+HQ2x/r5/8t9jiBz0I7/2CJZbi1N4vnC+aM7xCB9YU4/OrdyZ93FDH8Ubm6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786742794; c=relaxed/simple;
	bh=efZDmkuLFn1Cbw9sRwxJrNeeGhr8tE11Fl9ih11gG4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zw6WoMYZVD2GK1jrKIZjUOqmBRelrcWrgVM4Z4ldex30NKrb5aXRFQSiFTRCnEpuqf3bkdBrGz0EsrwLdbePI62CC/7Tm2uPuqr+Xpn/cv75hNbIQgKOL81mysFrYjWDdXMFR/T1Xw4cRjDMP1vWT7K+A4YJWcofkZPlng4UFFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pKgfmc/t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fhm3Gc4/; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pKgfmc/t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fhm3Gc4/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EJgqcM3187895
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 21:26:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zej0hJ3ojhA2wz5U7Y5qrHzGRc5LlV8oVkIjnWu4V6g=; b=pKgfmc/tKSpT8w+L
	l86Yqk1Zw8bhfgVcynhkMfR5RLSadImcTLvaayco5sN5gSKKZOhbJ/vuGmKlF+Xh
	vwoNfVn/i9ddEmPbxz5rJ1KXK1RXcRF/blVWRFFyRIG2O9YcXZrsUH0sBU0LgEyX
	YedsIq0rc8UtiFEl13A6XHqIokMaBQBgPQbDRMF4c3QxxPHhztDlC/5YSunapwpz
	ZX3MpTARqSukVv1whwXDgKSywcxu9l6lsK0lhHZVrD7kZ5d3IOXTyzAQymdmg9a3
	QREeE+2uafdyCFlTf//V4MPIb3am+Q9nHHdNvcbzjGeMIMuaKEnFn8YNAkDy72Re
	C0X/3Q==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g28sk0gee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 21:26:32 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-821167f53cfso38056597b3.3
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 14:26:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786742792; cv=none;
        d=google.com; s=arc-20260327;
        b=LIWJu5dK3XDRj5Lq9xRWdpIw9CiF7KZENzO4wAQVzWJFVpnK+usWEOc4dJk9gL+/kp
         9AwVSTtLDTkSmMOBI5KyiSxLTzOlMsqDHgogQis93Uc68OsPoaiWf7vHL6see7BoRXzB
         F0xYI8Yal39nWmuiA76a4zTGMlZ4RXjBrngvAXH2DwCKJyio5srd8bjt45vYTEVGps4s
         e9G9iUWVrnGccJjjXLlklLpCWyUB0rtblx7puJ6u5eMsw59yTgO2a/ZuyrrBUMxbk/cv
         kWogbTdaDSRSSfzBi5kyhODaK43HTdTKe56URC6o75e/Wrs7RuLv/xozJhiibypnCHTZ
         2Egw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zej0hJ3ojhA2wz5U7Y5qrHzGRc5LlV8oVkIjnWu4V6g=;
        fh=deyPxqgDWrggqmpavbNvZ2aTaCVJGJ0oLC6wro/qkE0=;
        b=HMGboHdhgARK0t4nV+ksSVpeX0o6dRw+wF6RZLIEwmorPhmfNitgJhfMODTF6ouajm
         9h21tOmpEULEK4IPH4E72rhmDr8Y4DsLOsxG3RLHhHa5r4K3WICn42MPgx4aojA++qf3
         FRF9VIXA5Q/BnOymEiIc/GhucnDxT6g4IMsUJfRJKXJOJ4zhNJvhQoJl8TJ6qU6XZWEl
         03VnRAJfmvsHZQwuhxjVd0do/Nftc7lvH5pkj36Nd9XgB/CtRQkk5KwABpaMOP+//o9I
         Axo8kUV0ym6utgS75OLMkXHqYz5bd2WwVv8VHjNgXIaYvAFVgscC7qsxlsqhcpzIztgW
         t3OQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786742792; x=1787347592; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zej0hJ3ojhA2wz5U7Y5qrHzGRc5LlV8oVkIjnWu4V6g=;
        b=fhm3Gc4/FCctl2XMLY7XYN8VGrUuw/vhDv8D6N+01cH7mQldPNEHeqKDYEqVz8a999
         kosHb3zZIHlpcrZuK3SoV/lJgjSra7xtEuuQHcRI9SQyCLsq9itJuVQ4FdnqNETGJEPX
         2LR6McGdWi2xh/I7RryIdctip3Br2zOFyA6agCwB0mwJmkVC42uvQH7IpnNRSnIywF1S
         fs6k+i7pTGYsmKl6wSSR12PjO0N1Og7ID2Xu/pmr0PSQ8I2cfcpaxAdjITahzNRppvCG
         nOfqgUQD/vWzs66+MsePBgMpXux/hfjzvTaXc2tjEBCA0ILfX1gekMi5mEEr5jRCrikw
         lMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786742792; x=1787347592;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zej0hJ3ojhA2wz5U7Y5qrHzGRc5LlV8oVkIjnWu4V6g=;
        b=tTMiwXPDuNBwoGI+5A66LfiqkqOY1oruaKxpSD2dqGuxLWbYpKJZY0zKyoMFJoswy2
         rCkDJeew1thabX3MtOj6XCCizE1nBtG7TviMiBQIoKlqWZcwMYR49+qva8ls3/PZeHKW
         Vq/unKDvki8kZ37sogiCqhU5gkeJ1GnHtFnZ7m8BNL65qhIi/J/wqhcfPkVQ3HetcG5Q
         mDvHSfPq+OvjAs+zUzZUYeS2fspVS8W/KQ2/9XKUUkhuMj75sGihaRKfA0MCQreoV5Uo
         /fjupk4c+TEqWqysJ1OnWcTcrsqNKINuv+k0FRsLqsIzeu40/dMTUWe2Fyi0ZwaaTxzo
         ZPiQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr4C3P+mEgcKaDCsTlrTo0f6gvPUzaJ6NLcrGNe/gBRNiu+U1TG8fnfyyM0FhG6DyDA6AbBq9rHi6oH@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw9mjq48HDgrnDznWLXSgPVB8fsU4HLYVNqYMjg2hxH2BVsOK5
	AQ1AR5ATXmHqyDaIhgrCOVB5OjIf8we5hW3Ae/zUNYbPPDy9O8+A9NI48HUCDtYKAwHtRNS9NV3
	R/gF44MqtNi9IrUSrklOJng3dL4txWNxj+PgoJlDEUXOdM1UoVylNTW+Sn2qHxMN1WsIIgJ2asH
	cHU8+9kQgXGhdXumsLEv+D2czBQBztyhX5b5Qlub9xrQm4xWmFlQ==
X-Gm-Gg: AR+sD12GNwXc3nW0up/S+PLxpPdWL2GmcFNgenGEW8pl9oENbmSEqH5mdDXdkILKOqj
	oIQtAx8KC8l90UOXeL1zuGHsrx4143bq+si8j6Rvh5XA99tZSqeS84VGwp5gCtWdCcLcoipDYZx
	K5K1JEoHBonQX81hGXedvpVWRlYOmmtyVFeYf9KAKTFUpl/oivSxTsWU4=
X-Received: by 2002:a05:690c:9518:b0:81e:a3a0:701b with SMTP id 00721157ae682-8370d7e63abmr26103367b3.9.1786742791732;
        Fri, 14 Aug 2026 14:26:31 -0700 (PDT)
X-Received: by 2002:a05:690c:9518:b0:81e:a3a0:701b with SMTP id
 00721157ae682-8370d7e63abmr26102817b3.9.1786742790063; Fri, 14 Aug 2026
 14:26:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807-agatti-audio-v2-1-3959b1ab8059@oss.qualcomm.com>
In-Reply-To: <20260807-agatti-audio-v2-1-3959b1ab8059@oss.qualcomm.com>
From: Chris Obbard <chris.obbard@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 22:26:18 +0100
X-Gm-Features: AUfX_myS8jNgrlnuXOoRb2R2wxOXEBoiR140euEsyMe2J6IpgUjZvJpu1Ma18YQ
Message-ID: <CAPnEM6b49hbfaXKd1y+JmF2FXSv8CAxau4JuUmJRZbX0YTpdpA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: agatti: Add memory-region for audio PD
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=LKxWhpW9 c=1 sm=1 tr=0 ts=6a7f8808 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=orM8XNFxbhtbf6LyTpkA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: 7IBPpuXJe4mOLgSG_PHaqaG2W6cVEiBF
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDE2NSBTYWx0ZWRfXx5uj6KOB+TTI
 ecyKFXXfuW+AYR7KLp63INQnwhtIsxsbDk3nDhsrxYcovBAtYsFe+hirRBTsOA6y4dWXq5Qimsu
 +F8fxXew4qmVa5t0cqFDuW1kRfLuI8w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDE2NSBTYWx0ZWRfXyzkKwLJoDNdL
 nsfdvTGnhhcrGCpE/Vvm3ij//FSTphOdznrTnB7/tTmM0I28u+P/23ratYaDQv+FIppGurZExLS
 C4dVuKrVzrkO7FtnO/cIzSxzlD0rj32+yxJmilGlaCYH5FNA51xJydArUIQLh+OfDPPjQdR+COt
 A0hfq7zXdyk92S6e0xZ0Xe1XTDUZb4CquH1fG2uuKPgkWJlquYL0dX5j8wjBc78somEPEj2G2Ie
 wxKVF92AtVHkmoVqX2Fc7YsR4bpMYa3ZgDuURrOH3K//Jfdg1i2r6+0OvYxyGFW2L6EOv/8jFnU
 crK6vnWf/oUo9IJu6QT4SvMKrT+LrYQbSaeLdnhepgVIUuRqjxkFLv8OehHQRyl188Sg6VDimBd
 84A5LyQnz31+vn1HE2CDtUzgvdnyGQInveLBB3wwC+WsK/UYZnGjOyMQa5HccD1wXIO2UB7KnNR
 PSTQX2I2xl70FWSXH6Q==
X-Proofpoint-ORIG-GUID: 7IBPpuXJe4mOLgSG_PHaqaG2W6cVEiBF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1011 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140165

Hi Vinayak,

On Fri, Aug 7, 2026 at 6:51=E2=80=AFAM Vinayak Katoch
<vinayak.katoch@oss.qualcomm.com> wrote:
>
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
>
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> ---
> Changes in v2:
> - Fixed VMID list alignment.
> - Link to v1: https://lore.kernel.org/r/20260806-agatti-audio-v1-1-cd6766=
cc9ccb@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Thanks for the patch!

This fixes a boot loop on Qualcomm QRB2210 RB1 and Arduino UNO Q, I
wonder if we could add a suitable Fixes tag ?

Tested-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>

> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/q=
com/agatti.dtsi
> index 590bd2432d85..2064eed01327 100644
> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
> @@ -381,6 +381,14 @@ rmtfs_mem: memory@89b01000 {
>                         qcom,client-id =3D <1>;
>                         qcom,vmid =3D <QCOM_SCM_VMID_MSS_MSA QCOM_SCM_VMI=
D_NAV>;
>                 };
> +
> +               adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> +                       compatible =3D "shared-dma-pool";
> +                       alloc-ranges =3D <0x0 0x80000000 0x0 0x80000000>;
> +                       reusable;
> +                       alignment =3D <0x0 0x400000>;
> +                       size =3D <0x0 0x800000>;
> +               };
>         };
>
>         smp2p-adsp {
> @@ -2348,6 +2356,9 @@ fastrpc {
>                                         compatible =3D "qcom,fastrpc";
>                                         qcom,glink-channels =3D "fastrpcg=
link-apps-dsp";
>                                         label =3D "adsp";
> +                                       memory-region =3D <&adsp_rpc_remo=
te_heap_mem>;
> +                                       qcom,vmids =3D <QCOM_SCM_VMID_LPA=
SS
> +                                                     QCOM_SCM_VMID_ADSP_=
HEAP>;
>
>                                         qcom,non-secure-domain;
>
>
> ---
> base-commit: 1701fda2f58e345c050f4309971bdc07cd6146ba
> change-id: 20260806-agatti-audio-357bcd74ae9c
>
> Best regards,
> --
> Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
>
>
