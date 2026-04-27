Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1371E1DF0
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 05:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777267757; cv=pass; b=POCnmf65IgPfo9ne/jtYVoYnsOUOJ5PC/wTfhs4VbNQyJzzC0SEKdLEomvOg72k5OhazaYGMT5enRd/KfDE7bRZg1NunCEpNltj2zFp/oJ/F8lJpZ3FJ4S88+QZUu7Ws43PmwuvjQ0Qnp4FCCix+O+HYBo/VmLpGntnX0vB1Uko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777267757; c=relaxed/simple;
	bh=FCCIzEAxvmMIo9XQqcf5NAacPB9XVAuaixKmKxe7xhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UCQWgrGBKnPuZV3+6n0H6SnTp2EjFDg0EVPfsQbkWDUOOU2S7w+hnB6sWvpYyTdQILdO0IVRLB4vQMAJ03iuAcaKV14rMusA6FUUF2axqKTJRa2mLTbhO/pHHTyhUH04iIm2KmI87flhONfAe7goxX/g3PG85lkzgM+m4rLXtpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GpFZxH69; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KJT1iBPd; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GpFZxH69";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KJT1iBPd"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R3GGol733749
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 05:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vfxgt144tRHjc7efN91/NQP+i+9F05EIrGQz84i14qo=; b=GpFZxH69ZdDJHPlU
	wfClCRDjGTr/ge4KTTjujRowDON/UIgk9NOvRsfeqmhTy17U96gWD9DRZ4L98Y9I
	UWfdqxWJUXJzgXiTJbz8cAAdZoevti5h0cjtJdbtBI4ZtIRoXabw/n/bGP6v3KX0
	X8FprSS6NmHt5ppMEv2jDCR6A0F0tWxv6zCuRg7ZlKeqFHVa+lJSTbvQkcwall03
	ldV6iwys2pmEFydBukjMpMXezp0INqB3JK9W6cWb6mPgUkr5mq+W6ke9/fx5JK1k
	cLLkRX3tFt5xBCI6fifisAaJeijD69GLzvq6NzkAYJcVVjaLWLrUByBc40tKJvH4
	7Z8kOw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqtcjjj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 05:29:15 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2cc75e79b97so27286061eec.1
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 22:29:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777267755; cv=none;
        d=google.com; s=arc-20240605;
        b=KEi+oW9gm1mhatEUd+7rBw5TYuvKENEH0W6ZolOnOPcn37oB45xD0/+CILrXMw4TUT
         lmaFgugfdb7LCa/kvVRKEhCe6xHouV3eYnJsO+cX1cMJoUxJwu1f7yoi35vg9Rg6a/R1
         ub7Nn9Oi4P4OIS2D2bmtnPa8JWyFj4Jz+jADhnfzlUtzblHBvCBVT9Na1JDWGAaGHpLG
         ycHK3kxeRwIjqlCukOBY2YkYELw7ehbc3rSR7/I+M9aS9TN3+jaLFv+NSJzMH7sbpcE7
         O8aqt620yrVOHKXncn8rx0c2Q4eBVPVYsJ35e98UK25aj/J6tjRL+Q/tLjSe/LfhS184
         rxVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vfxgt144tRHjc7efN91/NQP+i+9F05EIrGQz84i14qo=;
        fh=B9kgQlqbcJLlg+GKpPGTiR97TR5PSup2lIwK75JnMKM=;
        b=iW6/UqWF+PRCznNaa+GB0+M5AM7C66PURZdxX+bA+m1re2eYMxNQzjuTqRCzmlLsh6
         U5DShSjKk7pfsphMB8kNR72AJOWBXysx5Ou4WRWE8x2NtTgX5INK1bQled5hTnNf90Yl
         /kkbvzP//EsF9YuzBMd+U7H92g3vyX2owxfcuIW7bQBAqIUMGHo1Kl5qS3NN2QXs3iMe
         bGTpdfdbIRCSEcUApHb9f3qEwLU7uFR0VqEKgI7XSy8glTPTQBzraF+qACc+X/M07L7h
         edQCZ1kvUAXZoK35krxPfnZzc2v5tWuM5FAmgGf8R58yKSTMsLUTQnVQ7eG/GgG6XbnI
         BwlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777267755; x=1777872555; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfxgt144tRHjc7efN91/NQP+i+9F05EIrGQz84i14qo=;
        b=KJT1iBPdaLIbx1BiKxwWSlDrZ0HoNsVnq5zQ1b+a2CnC/o2sluGQgPngSsMbvwDUWw
         TSTdXU0ePUvm6LKKV+gJESlPzXTY56Sd7WLk2fExCGkM03FYWimfNCK9aQRpOg7nUtlE
         7aYQ0gNguzOvz9z5WIbpoOYpHZxbz6vUps3W4FTAspWjmuLiUP5vLn+XZf52jqYVKSqF
         efhGxj3VFjvMmCC43fnMjnXMhPPp6uf7crc7Wy0hSawt34CENfc5S2Psd1JMxqbTDz3g
         hDgVsYx4gK4BlIiaT0SGtzEaXl8xJ/5KyKXF0W4uWUAXogMN4EVW5sZtf9B4mDQDQkxc
         63rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777267755; x=1777872555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vfxgt144tRHjc7efN91/NQP+i+9F05EIrGQz84i14qo=;
        b=PU5OpW3s8SA3Po1ND4GXfGPBZ6KtKzABjgWmnd6CdVkW8Ed1jkO6/yT7y/fSm2hIzJ
         UYmdJ1IM5DFyyD0xSMbVMfuU1BOxO0a3oflqMkXeMqhMXmYIODowGm4R+mBDjpsrlsdv
         pKoiWx0+38hkqo47EBrpxqZH/TRuttV5hWGM4CjV118SqCnrhMH8g+r3oKdfQvI222gj
         Lql8cq1ZdqjmFLraGw5iJJtgN5bDuE8FzoQw7ouJHjzHAXSsFrd1qRbqMJt8r+oA5AHp
         L/JeR7BMNbKRlWY+ACU6H46piD0YPg5ehepa676WJAIj60zMRoR6/NgvT5lZsj5bhtxP
         fIGQ==
X-Forwarded-Encrypted: i=1; AFNElJ/O4qi10agH0FcEuptkYpoTzzVRG0Imol6zRQLvntp0E+cVsvkjcdvsfohOrzeMLng5DN0VRXKcZW9g@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuf1f2e654fje/PBIBF+7I1hsLfOuT9HY0EUJOkBwW0C0yEZso
	x6ZJhpHuVwf21gIK4Woa12LhCFsxkCWvq12erL3Z64XvVUTIDJXhRjOTGSTzIrSCmwFvJ6Vsjgw
	bkRCFd6xqNkciB6AcjoiMeYBtfEPLHWJnTUO49frhfedCsEozHkW+Cxdltz1mPa6rP8nFDzBIIF
	+Bz655Cc6OZoThmi2L3szXHAbJu+nb+1wEUBjjPgo=
X-Gm-Gg: AeBDiesCAfWRfi8qNBEWjsrW7fmq+3/mx6fsFY8+70J7HBmBNmBGwfBLcpivdQIfYNn
	gdEi4nOtt4s4pAi6nCatykkYuLBLMtR8rMD2W+5l4KnwT48qmLdrFo9rohHTcJVDaKwg84ESz2Z
	UODL5smwdHql8DPU9LqgI5KkE/6THyxsiY+wwJP9b1UbZg+k1isi6OqJTvJ3/2I7lxYbcCSNxPV
	eBhxeaUx+79vbRCHA==
X-Received: by 2002:a05:690c:f06:b0:7ba:e1dc:1b3f with SMTP id 00721157ae682-7bae1dc26a7mr342619417b3.25.1777267378691;
        Sun, 26 Apr 2026 22:22:58 -0700 (PDT)
X-Received: by 2002:a05:690c:f06:b0:7ba:e1dc:1b3f with SMTP id
 00721157ae682-7bae1dc26a7mr342619207b3.25.1777267378258; Sun, 26 Apr 2026
 22:22:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260425031712.3800662-1-qian.zhang@oss.qualcomm.com> <ymi3o5tdtcojobsgeqn7mlelcr23bchuhi4jvh6fp6obi4siu6@7h2idqhhrolk>
In-Reply-To: <ymi3o5tdtcojobsgeqn7mlelcr23bchuhi4jvh6fp6obi4siu6@7h2idqhhrolk>
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 13:22:22 +0800
X-Gm-Features: AVHnY4JgWEICSa-1BSwnoNXvSB-C1earMtMJzrPD4lG6tfkz6xMeZmSnO9yQWNI
Message-ID: <CALC2J1MVXkEQ3kK0m9bnaqXr8vM=fiVy8BZiFX+p9o3T_-DRHg@mail.gmail.com>
Subject: Re: [PATCH v0] arm64: dts: qcom: Add fixed regulators for WLAN supplies
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        hongcheng.zhang@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=J42aKgnS c=1 sm=1 tr=0 ts=69eef42b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=ogS9yFO0HJCNPYsXxisA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: -p4orqKj6XktDEc2I1hN_sovc_WBUJgR
X-Proofpoint-GUID: -p4orqKj6XktDEc2I1hN_sovc_WBUJgR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA1NSBTYWx0ZWRfXykIkFBo0foIJ
 cbPcWnoWsTlTk/m80dBy4FaoEKaY/382IfjsFEo8TsV6Kv0+W07oc/Cwc/EJny1JQFZ6XaFKAvS
 l1jn1oa2u0vwQ8iRoJb4DQzLPFj17OJLNVprVbMZKjxVpFPmOxJFoQo5L2pOUdPKToofdq+t5oK
 CNyYdoZDGv90gcN+zSDo1/sKukvibEeW+raekz9L6MQvDWdPM3ZDVp6C7RUVcz95BUbG5w+lW28
 mE2eIZHki9YXaV7hRd62n/b5Cz+AKqABB/FYWONeaJN87loSa9C7dqG8ClFrVynseY3Fb9OK+Q2
 8Aw+j5HBbMXNQAkuMF1NkCSaqm981PsBNMqBY/5pNmadamDqUNHimV5rINT3T/XP/Sxi3ZPZLYb
 k3R5UL3wX9vkXJjy3j8JT7kH87PyneRqcIDzklm+2Mp2t48jgCizkgbgzNq2Gz7tmM+5pKgPO2c
 x8vbxYIc4OdBj0rgD+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270055

On Sat, Apr 25, 2026 at 10:14=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, Apr 25, 2026 at 11:17:12AM +0800, Qian Zhang wrote:
> > Add GPIO-controlled fixed regulators providing WLAN 3.3V and 1.8V
> > power rails for the Arduino VENTUNO Q board. The regulators are
> > enabled at boot to support WLAN initialization.
>
> Tell us something, how is the WiFi wired and powered up? Is there a
> correspoding BT, which isn't mentioned here?
>

GPIO56 is used for wlan_en, and GPIO54 is used for wlan_rf_kill.
BT-related GPIO configurations will be submitted in a separate patch.

> >
> > Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>
> > ---
> >  .../boot/dts/qcom/monaco-arduino-monza.dts    | 21 +++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> >
>
> --
> With best wishes
> Dmitry
