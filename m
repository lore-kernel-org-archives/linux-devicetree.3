Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA27F1F1534
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 00:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780532289; cv=pass; b=DID+GzVBRs2usteSZ24/+CxbOqjPRV+9q5/JkRQfqmVOJuLi5Ee3pR2EXr4YmfJIVCVui+LHK/yIm1AC0YTQnvMfxrCD2P+OUbz2cwC0vqR13nKz/+cQ+k3rQn1xiqlbcdkK+Z2CNLLaV/Wc02FeTM3bU6gwahKu6AD0ixADANY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780532289; c=relaxed/simple;
	bh=Ap5/C6EYcAmS24Sqi4LrbI1m+sbWXPWi71vnz0mEiv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CYjGyqogJvbFVAgca1phn4Vebnj0WxD4cl/V/+Ks2D1icxzzrbc/LhvDEUFEDgTaSeK7xZlOuUNVgWjp+EbPIez0MlMc1TbOEnpZnbST3Uj3bJlaqJElJciAG2VbOp3kM9Tq7OuYw/Rik3i9j+lfX6uh2Qum/5J1weoMdRvIMdk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=anQOUATT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XsvT7v1N; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="anQOUATT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XsvT7v1N"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653KAS1X1946638
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 00:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aYFYc38r2qZwIQxvzB/fkxnK0uRpZc2lBvWrGqkrou0=; b=anQOUATTN0OPiy6o
	uN/gF6rlC4itvmMdtsyzby0zHUFK/c9v2TfgD1EEZlwPcLIgnc4uHXKwjKxW62JB
	m2kyVYiwN2JVfY82fDFgrmeK1JN/jN15BsRKF6+epHDjYTtHEHymETteI7pgIQ91
	5VEgpctPwtUb0/IDWgp6/HYMdZHbK+tqRAKhFOQN47e+XMzDwCRijZC850fe3eG/
	U7VLx6Nh6kBFsma+ONzUnpzA9+OwItMZKx2SVyVyoWM/FDxZyer7jLb3ScYVg06h
	0I5lOJ1dICZUZmcjNvtSCxX6KaQpf78wAZGpfBquJcIU0GIqEKPC9rE0Sb4S/9rv
	fDadfA==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejabgn4pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 00:18:06 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-43d1e8bbb82so339587fac.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 17:18:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780532286; cv=none;
        d=google.com; s=arc-20240605;
        b=X9MmuiWkMNwx7o05X+0Rux5c26FMpRtiihqVsyeAoaXtGtNIXnWaARpOqPRU2aqMGH
         KWUa/mfCynQCIeJbFqeQ5NkV0grlW/54lKJuxP/MJQyh0icUQYK+ZFpSg/1V7VitzKdD
         qolGdo15GxLRSVbTqXiADxfDAZxYaHwt2EomN2OLvhXxE4FyB/7Z8wIWWDAXEtH/TJMA
         KSGsvDTnx7p6xNpo1SVZskxBm6kNShL8ljMCgFy7k/7H31m4X1OoCRF/I4xD0rK+Ghnr
         x32qlRk5LWEPwUphHKlQrDQE9BNAYCo/vSuLyu4o0lQZ1sYcc7kCrevAL7c2jzvtkXbu
         IQ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aYFYc38r2qZwIQxvzB/fkxnK0uRpZc2lBvWrGqkrou0=;
        fh=Ix8C+J4v7B9oieq2cS1UEHo9TBd+h04D3vvU9r8KywY=;
        b=d5wIFDbq2jQyTdCCzO1G+yRCSSMgtSuUcifAWmwJimDltyzYgvCFOLUSQ9l9/hd7mS
         2/lKcbwLHI3WzKwUTWjT5cJK8YfaSWck62a7gGr37Mw6MQ48GO+wn5M5++nX/VeyWo0t
         RKqFBbQDe2Q8XJ2GhJPDV7Ip4TnoBbUn7EsmsJUevD+mSmcT22VEawZNOZMMMK+0RZ2R
         XOoP5hwKwhuW2a9ElFUfH5TEyNBqhObT7/gXNm1u10wLG3WIuJaHmQo4yKTJMzIMMm6I
         GL71BIUV3LoFByCb+fQ5G3n0Y9+5sJq4Xh8cWRLWGeOj9H87zliEel5yESrvG/dK3MzK
         bWIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780532286; x=1781137086; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aYFYc38r2qZwIQxvzB/fkxnK0uRpZc2lBvWrGqkrou0=;
        b=XsvT7v1NhGxOnjhTPcw3m3sH5YL8CcwBCTRBOnwKkjD9zQmIDB+aYQsb99ZeaMcopq
         GV8F0rtWBvksFp1h0tPLqzKjrXgE99DzFYvN2cS5r42xAr2gf9hRTi4yqmD3A9KwQOKw
         2nOb953wv+znisUS5Q8W3hH+1V00md/3mRNoK0JjQNQ7KOxUKejRZsph1uN58rw6Y6Rw
         U4vLYZR5zB2RaNHhbfrayxnx2YmWskGI8W2QBFMbHYQMWa9mvk9w/Cy8c9aTRdihchwC
         V5uhDnm3D03X0F/F3B+HB+zAhWVt2Ic+WnxQIqiNfTwjvsvgR3l6enYsuscxJcqbz0iR
         APmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780532286; x=1781137086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aYFYc38r2qZwIQxvzB/fkxnK0uRpZc2lBvWrGqkrou0=;
        b=qUo4cclkb8yRFdUpsWVEEX7tr6fCdYDrohunm5Yni5GU07nYfW2Rzj1Wqtab85bAuo
         W9cAKoyKzW0PbBzZsteR1P3Jy6Cp0R7/WbR2GigaIyYilgGE8hmdeybsD5M9GquCZADn
         DL+NLmFL0QwY+blLHicApu53oat6zrspWuTWLaCyUuw8NReFm40oyOoenFLX80Q000OQ
         A0fD+ERDC5xwq7A0pPOrc471uba9H8P4Srs1cB7D5f1uNqvy8d4XrNx5X3AO4PrgMTrN
         tngYjTloiRCaFcL5680Vw//DOniIOs0heDz1ESpuejAXA3twf7N98RFC7D5TIBuOz41N
         jmPA==
X-Forwarded-Encrypted: i=1; AFNElJ8f0cDbTe2hA0Myc7f/q86FPGxCww3iyTY8auw+ZYXdP3VZBZPBeh6xY2sK4S3rNlYr0UuAbPZmT5oQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs7cPBHhJAosBeg+kr9fweLlnX8cgRN7YiTO3Q1FYYe7dw1oWn
	9sO6kAqaKGPIszvK/5Pw4TtAwMKzGuMtjfYH0b1zi8PtSzsbuKJk4ZGziUf9VNazGlFWjYQU96k
	KZLfQIo4YCAroZLCCUUeG7y4spXas0oxU18yqvLeUf21sznW1IH+kGjC/pQ+GB6lyByd44I7tsi
	GQ2ykjq5gpwkjyp4y6Dwwyw8v8EJZFibZDCSVY6dgya5KbNZkj26eO
X-Gm-Gg: Acq92OEPf+ZcNAFXSoQqVSUPixc4CwZoj2LGzi9s3HLj3fo1pCJ+ZkXSKtJxj/+lub+
	UUTL8WQyHecISrB4D8+RoXBqjkEj3o/zemTfUqtugE4tSzmGZtSwG7TsSnBwKAsg4cHNSwH2i1l
	RtHKS0BwSRnD4awQjQFsX69xP7rr84nHwtu5c94qjguUWW3k45z11zI3yMDmco+wsxXKgtpkbwi
	P0CvIB8l9nQntFhVQ==
X-Received: by 2002:a05:6871:6c12:b0:43d:1575:c27e with SMTP id 586e51a60fabf-440db59586bmr3818742fac.6.1780532286177;
        Wed, 03 Jun 2026 17:18:06 -0700 (PDT)
X-Received: by 2002:a05:6871:6c12:b0:43d:1575:c27e with SMTP id
 586e51a60fabf-440db59586bmr3818728fac.6.1780532285806; Wed, 03 Jun 2026
 17:18:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260531071409.3557734-1-qian.zhang@oss.qualcomm.com> <7c33cf4d-4281-4e26-b1cf-fb6635b01b72@oss.qualcomm.com>
In-Reply-To: <7c33cf4d-4281-4e26-b1cf-fb6635b01b72@oss.qualcomm.com>
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 08:17:29 +0800
X-Gm-Features: AVHnY4Lwp_ALRhn2rUTfU-Gw5K0PDGTD7aLD8kz0n01YYshYrYHqyF1L2DmDom0
Message-ID: <CALC2J1OczZFBPFZMRK1mYew3E7YQKt1rM5ZcgSLkZLAqp=gKKQ@mail.gmail.com>
Subject: Re: [PATCH v4] arm64: dts: qcom: monaco-arduino-monza: Add QCNFA725B
 WiFi support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=R6sz39RX c=1 sm=1 tr=0 ts=6a20c43f cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=SEjN4l5unJ3OIN10KysA:9
 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-GUID: 3AUnOn-AOk2qX-YGc9hFCLIOXwXvlLWL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDAwMSBTYWx0ZWRfX2Qkm9S7yNqu8
 Z6N3zfoNtFNeSdJ9FrrFrUvHv6NQiagtB9flprFcRPiYus0NuJfTbaQ0rp+1d1Kd/KH8ARPHbkX
 ae1Bn77ZmZvdfnyzxp8fMJfl6uq/flWqOiIDv9Jjdf2yTwYuW33cVvnV0evGSYBiqakz5Z8VaE4
 TQmHI/8MQX1QbtoKRNKrZzP950EkMR0ZLwn0WmsbgLqyL+EYsisJeXu4XXkmcWA9g8iWeQ78jnr
 c14TaP6Bbq1DFXewWceXYXZhHpPzjquFKDKjG82yWueW+RtP9ZJdhajS20VDrX2HCJjD5lv7kR7
 MWqA4U0Z7Oa82X+wyVfEHBg+0xjl7oRn0HqkwptTIPq1hBXQt5hjXbFk+WQAK++/iIDiLhegKqh
 AeXI6GJdteZhBkb71GoqRwQdnLqsA0AcX6gFGzYLKCXy00vOF5PNb/PoPD/fu41QKU20W70Zja1
 EWeRsq4cEhw3zAaneLw==
X-Proofpoint-ORIG-GUID: 3AUnOn-AOk2qX-YGc9hFCLIOXwXvlLWL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040001

On Wed, Jun 3, 2026 at 10:04=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
>
>
> On 31-May-26 09:14, Qian Zhang wrote:
> > Add support for the QCNFA725B M.2 WiFi module (WCN6855-based) connected
> > to PCIe0 on the Arduino VENTUNO Q board. The following DT nodes are
> > required:
> >
> > - qcom,wcn6855-pmu: manages GPIO56 (wlan_en) through the
> >   pwrseq-qcom-wcn power sequencer, and exposes the WCN6855 internal
> >   LDO regulators consumed by the wifi@0 node.
> >
> > - rfkill-gpio: exposes GPIO54 to the rfkill subsystem for RF state
> >   management.
> >
> > - wifi@0: describes the WCN6855 endpoint on the PCI tree.
> >
> > Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>
> > ---
>
> [...]
>
> > +     rfkill-wlan {
> > +             compatible =3D "rfkill-gpio";
> > +             label =3D "wlan";
> > +             radio-type =3D "wlan";
> > +             shutdown-gpios =3D <&tlmm 54 GPIO_ACTIVE_HIGH>;
> > +
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&wlrfkill_default_state>;
>
> property-n
> property-names
>
> in this order, please, everywhere
>
> [...]
>
> > +             vddio-supply    =3D <&vdc_3v3>;
>
> Just one space before the equal sign and one space after
>
> [...]
>
> > +             pci@1,0 {
>
> pcie@
>
> [...]
>
> > +     wlan_en_state: wlan-en-state {
> > +             pins =3D "gpio56";
> > +             function =3D "gpio";
> > +             output-low;
>
> The driver that you pass a reference to GPIO56 already controls
> the output state, drop output-low
>
> Konrad
Will fix all the issues.

Thanks,
Qian
