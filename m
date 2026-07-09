Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EABA3E6398
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 08:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783584210; cv=pass; b=N61cIQqBQPBr4ZDKcWJ1jRuyYA/xzaHacOpo0YBfhLJCsCVhVgOtLQZO3nDMjW7dmVamgZHkm4YaHqvBDucgYgBjVVJhpKP5m1Vlsf8Eefiz5TU3dX/2M7w52syDFZX/7rM79zE9duLrsULYpn4JDjuOpj1cYcgXRdlBMWJTObo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783584210; c=relaxed/simple;
	bh=xPU00qGmkekBWOv7JAHrek89qumcbSYzEdT9g4KfceA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZAeK5NPvOULLfxiJynY2I84DR2J29TiRULwmClFuaInWDmuLYo6HhZdMaheL1GfqHUnoah2cyCTAroTt13D7pEwv2q4ZKGD3/LkGoeyTb7FjMhiN6PYV7nTsZdbk0v/UppB+7aggH0cc+3M2MTcReSPoT4uCakgoBHUgybIQRN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G4nFeJco; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BKall1Iu; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G4nFeJco";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BKall1Iu"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6695xvWn929297
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 08:03:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ny0lUMasGBKz/MofrxgPCGbXZ9Lc7jZtKzpy+Td+EMM=; b=G4nFeJcoTtXyscNT
	CBJ/T3LKpoOLtVro2SUW0PrZz/wwmoGoPJiba3kAu23TZdLZt6YCj0XDwuUpwkir
	XurLxHyptvxynyFpdL9IzqwlwQ4H6VFYMW4BCNoT1dRT003R1Ds7+f1ckGLKt8wV
	8hiWTlP58ThmtEEDF5+LUiR4WrJyv7oH+hlHgEqEQxZs8r2h15TqH/cRIg4UcHAx
	ilP/WwFp1aiohQFd4DakFpG09mR1svcCNjMBYHUTfF+Z0v91/5RBJXj8QZ7gbLyF
	1+pdmuU0e/imysE8gPoeW6EzDEMCaYkEeBZ7C0NrH/KS+X7BxI6z+78EjjP2jsIQ
	J1GS+A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa418gw7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 08:03:28 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ef8249f73fso13589956d6.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 01:03:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783584207; cv=none;
        d=google.com; s=arc-20260327;
        b=V5c9Ky2+zo8ffTrUQL6P5GmRhbGm8sFTY/NRvD0t7psOkfSKYAAYHoO1G6M+u1jDt8
         O6e65pRsczMBi+J7zCMBMj0D9QGYPuHMUSr34X/kUDlO/Ostkll9m6W4bLMWjCEwKSPg
         LxwN+COLO12NzEAudcH835gHPI1U1m/2JZd4Lzfc8ZnlTyux7xODlclBO8LxopL6mM+3
         6ICcTrhUWre532BVdFPUEKGgRs0eYORz9cnAJFJI+uVAU66P/J5XNtIn/bbwEYnGXvLE
         fo/JDbusYEp7OYTFsTKUPjYdZRrHkGxxYu3kh7L+V4gpgwYu0t65ohF408x/kSDyuqvx
         w5Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ny0lUMasGBKz/MofrxgPCGbXZ9Lc7jZtKzpy+Td+EMM=;
        fh=j8RzmSLc8lvwHAx753MXdq6PKKmUt6Mmgx7ufZ1wFRg=;
        b=AfOdXPgiEfP0Yfr6gAGK8yC8mzgFugw63hSjOEsLDyslqSxX1w4YowX4o09HDIIvE+
         H9g9qiw++df5RiMu+rYWrpCh7blc5Xe5t+vppfaYBociHfHQSIxAZFYfrn3V/fZKbrOA
         GtQw568kE373f8mhX/Z+ujXxkulYqlayrgv0+orZIcdY25aur3KWLy9NtryWUHOikKcv
         AkFSb2ZyY+hyjGU913+7VlFRS7yymVy3SiwP65PVz7hCL7DphAfiHkMnhwx4LpKG6GY1
         gZe1kCHFaVRJlBEkRM74AD3s0kIfj03qMZ7H77I0KNdYQ0e5wBOAxhvP1YaLLKT6Ft6j
         wIjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783584207; x=1784189007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ny0lUMasGBKz/MofrxgPCGbXZ9Lc7jZtKzpy+Td+EMM=;
        b=BKall1Iu8lVsZCvhOv855wvxxfm9ES896wDAZm0hzXglPpOKBZw8+AZxjVhKJcF2CU
         6oOd9ppDr7WAb7XWbQyEr+k28PWUs59uDR+94C1x4dB0P4EzPsFH6avtNsPmPbp6VWJ6
         aU4Z7zEYIpxBsThKn74FwRwb1kTz6yRziqxqHMj4Fp8ZHE/nAN5KYJ+h0ujwjqjWCJBi
         DoN+dfA3aloXKp0ANmASiRH46PV70DXHxO23BSLU2/LeVXSc925iabVcZZnzYUoAPzIn
         bLWu8I2VXJkcEmonkTQjGXzYRDkG50mWuGvtI/ZGBoNX3C7R4/ml61TKza4Y1XFWVUV6
         7WlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783584207; x=1784189007;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ny0lUMasGBKz/MofrxgPCGbXZ9Lc7jZtKzpy+Td+EMM=;
        b=s+nksO/hbYa6GZXc3BNfOl468Eqw/NXxzNlmez/KWB4T+IuOnHs+hHHCf9P2DhS4AT
         YMcttslHuMBHVLUddD5/LrLZCto+wGOKa4G/9KbGuqd+VZ682AKcR9HZPRhp2+afD1kb
         Lu4avbzIPgAMb9Z5PCgo/Tl7KIY0rMeCB2NQ1C5NAb2lT5fjSX2G3NV1kiukpIY1Bv2P
         EUPhHNhgHXzzW8p/cTLCVtwjo6X6Ofrw6irqfBfT3gWV8V7E57PEcC6qp7iE1RsAs3jD
         RPz9YnKqwq4+E1KM0S/qZavzmrteezHFu5tF6ImhrDGoAV9h4+ufmu5LCGCacJZxM14n
         mSJg==
X-Forwarded-Encrypted: i=1; AHgh+Rpc/vr3ZTZR95oQMJw8NKM089ymFz8vJpkikjbzgJPk0fYobeUWdZYYVSlt5PQsXsyJU4p/MWC7cJg3@vger.kernel.org
X-Gm-Message-State: AOJu0YxTyy+aroI+ZF6nuRnlollRmMPCVDn28Cm20dooHp6l9lf6bF3f
	wsiXEQE7XagGiVClc9qXmU2YEzu4UEi7yBmMBFduxTwhuxvXWYjaQDPHv8fkrIQhS2evsXQJZdR
	8Nhwwt7ctszrTPGLXowiREuS0464/cs67COb3Og6PmsWPnwWRXpJjNHi39cbAqhKlG0GUY85REZ
	khoPQguKn2C3UC8gUROZzS+cAJ6l6b+s6qQx/PZi0=
X-Gm-Gg: AfdE7ckl/iNsj6jUXjqHANhq5Ao50gEoTewM8CjkpbcGGsj2yAUBxQCQ9cOOyhpjyW6
	UQe8dZV1Gcinhpyxm8wTAw6RnKeD+z7ZIkElVQseQNf/lIWcrQchvLXUkq6NlqA3fuXAVaILR/f
	lm5Pr2g5WQAsgZERGFW0Rls60qG1qurXiD36sIw3ljcrNqHmZDq2zUsGCe/Wv7liRAliR6Rzyos
	xyuSFdLwQSWiwz0681pU+FgxS2dEnGkPKvK1A1sfFSFsVBj/PAGRL40oxzGEJQe35jV1jcLJspi
	IVBp3uoNZA==
X-Received: by 2002:a05:6214:5b06:b0:8fd:6e22:c7ed with SMTP id 6a1803df08f44-8fec3a00590mr64055396d6.62.1783584207433;
        Thu, 09 Jul 2026 01:03:27 -0700 (PDT)
X-Received: by 2002:a05:6214:5b06:b0:8fd:6e22:c7ed with SMTP id
 6a1803df08f44-8fec3a00590mr64055106d6.62.1783584207066; Thu, 09 Jul 2026
 01:03:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-buttons-ios-v1-1-f19feca52b60@oss.qualcomm.com> <2buu6nb2oxk5r3okzc53yyu6f5que5mqjbwiwxctypwzrpqmma@q65jf2hzr4bn>
In-Reply-To: <2buu6nb2oxk5r3okzc53yyu6f5que5mqjbwiwxctypwzrpqmma@q65jf2hzr4bn>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 10:03:15 +0200
X-Gm-Features: AVVi8CeKsKTVfOVvU6CclYadIUA3_4HiioMsx5UJodvbTbzgMTxGqjSZrB3G8g0
Message-ID: <CAFEp6-09qcruk8QkB7dyaW1+Fc_FPPeD-WOTZYHe0Er2acPC-g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: monaco-arduino-monza: Add sleep button
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=UI3t2ify c=1 sm=1 tr=0 ts=6a4f55d0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=oKb6TeXHuGpcAoJgDn4A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA3NSBTYWx0ZWRfXywfoI74ppLWT
 wTHXLpJYYaHxgmxhjxLLDdvMQL0NaX52VnAg5TZI3b5a/K+hsCe/19BM60nGLczZjTEW+D9T8ZH
 udiIG4a2Q0dpXJmnCj6riwqIPHTcDC4k87oJl915+NYESnTGLRsnqW6qGpDeeCXDU+8TzH71Mg7
 COBg0JPfZEmk+xRlUhJeGcZoZRAxuy2W6wHcvffaDfME4fET+2CaLmUHVAFwz6r8S0Rfyd26Siw
 80EJuK65E/nd88atjSRTZLzGGff36aTm/ZzrLafJJzmMB1CqKTzdIdGWzq5SEondEICg7ba19ap
 aShR5ks7bW4WvsGxezgxN/d0mrxw+xrsVTpSsOKVSBu5lLAX2Gp7NhPNp+bZf799Bn1JwduR7nG
 7kh+bEUaCBYc9C1VBBKTPSRhWsUP9kV4z8oR9j6ntsczH1y1R3SRe9cMieOsV/VnoA+oYN1qkpt
 uzj8d2O9TTVWr6XtCuw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA3NSBTYWx0ZWRfX3AGE7iDL9r+F
 yQyU46T58EqNMAnShB4BfQd4+f8VXTLZbX7UYfIARRV1jGV/+TeLhF7UA2RE0iYuGBfgXNTo/pD
 N0Ol9iBYt2nSd6t3m1kqdNiazu0mj90=
X-Proofpoint-GUID: SV40jx51zPDck1nIdZYz_0NRNtEu5pSq
X-Proofpoint-ORIG-GUID: SV40jx51zPDck1nIdZYz_0NRNtEu5pSq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090075

Hi Dmitry,

On Wed, Jul 8, 2026 at 5:48=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Wed, Jul 08, 2026 at 05:30:13PM +0200, Loic Poulain wrote:
> > Add the board's horizontal button connected to GPIO69 as a gpio-keys in=
put.
>
> What is horizontal button?

Two buttons are present on the board. The first is mounted vertically
on the board edge, and the second is mounted horizontally on the PCB.
Their associated signal lines are respectively labeled VERTICAL and
HORIZONTAL in the schematics.

>
> > The button generates KEY_SLEEP events and is configured as a wakeup sou=
rce.
> >
> > Note: The button is actually connected to the onboard MCU, and forwarde=
d
> > to the SoC via an active-high GPIO.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 22 +++++++++++++++=
++++---
> >  1 file changed, 19 insertions(+), 3 deletions(-)
> >
>
> --
> With best wishes
> Dmitry
