Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF3045D921
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789115640; cv=none; b=T31jC3iyAPJ2ipHY6JhvYlCmEJ1HSPY6q+eQm/jFKJXha5OQlcKbj10UwD2X3re6a3Gm0Gssujb1w/Oh6BJExoBCJAT1Drjv+h5UMeorG7A8hcQthVpDVFTWwTxX7i2HgLlTOW0HEt4vWF+4b4SGDWM96UvD0ObiISYmWyYi2Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789115640; c=relaxed/simple;
	bh=HGKhaoZaWNhzHqAOBnUZoKE7Fx3fCqI+Ye/JrK/9WtY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:Content-Type:
	 MIME-Version; b=ujMmLHF0qXKFX7KyXQ51BEQBM2Clm3oARqRJAq4Ij5HQlzUoR0dsq/CuX8sOrW/83CAmFqlSUMsgAWeM7vi1qnRiJ2LFXorL/RnbgHWmrq7YOazjk5U0WYNyG7kvKwZKB7gWM8Bk0RkP+0cKpghgo7RDlK6mlmTxV5ovLbjbsr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JHe9Nkzm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XC2mffG9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JHe9Nkzm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XC2mffG9"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kpof3513943
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:33:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:subject:to; s=qcppdkim1; bh=H9L3Cj/P6SD
	A1IrJ+9yQeaGiza1a6AR+tRIbA3GQ42k=; b=JHe9NkzmJKeU0fLCLlcxsnBFRdO
	xl0ooUJaEKGmTDsyzp7s4Fq7XjuVpgki1Z97wonE/5CHgd9WH9ozgr8k82puhCdg
	8V2SjYOzOaVa0Vu7DpZ98l+o+F1+IP3yX1FpWTIz6/l085zPIuDwny4ve1MPw4MQ
	yY4fJi2u0Cyy1iPY8JrRVwwdhiTqOMBN6y09WCMAyzdUD/7kKk4LE0lgvX7uWjTS
	0BlMKItF0/wz08mWP9+MmwfdRXSpUMMOSAQovCZaaTjE1xfDz0bH270QVAWkpX+O
	314IeLHZEfDi4L0H+9f1qP9+DQZ5cTrNsAyn/b7KD3a2KZE7pcaR38zqNMQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd50qdr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:33:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e4f946461so124621585a.2
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 01:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789115637; x=1789720437; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H9L3Cj/P6SDA1IrJ+9yQeaGiza1a6AR+tRIbA3GQ42k=;
        b=XC2mffG96qoRUuAtni4WCOD+1khsV6E0D2g2SAFn+/ttZOLy5d9ZE1Nb/AxFc9fsTR
         ydbd0ILdihLzECrM0ksH1+f3zQAzoq5bLCJg2xH11eXXasp15PDe3DqCxsUd4NPjg9WE
         TtzKO7JnTNY/ZCOdmHag6Fvm5O7bcvoh/Z0utZE1WVi8nRxEwMCLGU+uowi/aHIw64OP
         qxjJVGGgubE2seQZ32zBsKnp+zQwTJCSLR96TtnSDDViF/RtsL0mGj7BQGGrhnq6KU5s
         8mrtgqDzXMuHAGVI+PlKPxv/N6Lo2qV5vuKGe62SeUG0qUDFKnS7q8MLpUXFdPRkWQLk
         cX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789115637; x=1789720437;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H9L3Cj/P6SDA1IrJ+9yQeaGiza1a6AR+tRIbA3GQ42k=;
        b=QRVEyOkhzFhOdveggZLEoroMMNKZ6uATGa2LyDhBzKkV+T1MNBn1VbkCbFi8IJTGby
         Gb9+eZw0ujFY2MBwPjP3qHKbDkVgoHPzlnZpd46ZwvzBc6BgH6hFJKbZvp5ATmG5PILs
         e/8p3ORPHGoXvXDwmeeEx3OBbjJTPufCRgfNXFAIpfCR8fWXjvyDlt8K81/zyuYlF47n
         YVjlTamAEKCYiLKQgKP+3eVk6CNFPCaBZ6W7gOhakgb82oe/0K2smb3RmmPK+61+zfGi
         4u/D6TSBsEIgvO9NBBbKBsmWznplWpEfjEf3B+b2ZAIgxTwZkYPT6S4g70Z4NnxC/jjb
         YQLA==
X-Forwarded-Encrypted: i=1; AKwUvBzu5MC9wQNmWrXqH/fpZBrfsGsjOpfG2wgXhB9H5EJLEV7RJYNND6bcFSp4dYK6+V6+NXZ3pkIMM5iI@vger.kernel.org
X-Gm-Message-State: AFuF++kKNw0moVbja1u0U73ZQrXr9d1VrgP+dGrusw7inxNBxsgvw/SA
	g5dVardoYeuutMNN/wLFWt2TM21v7XF51iauRpwhz2XlzYasB4xbpe8t18Q5EVf+hy4Z2nCtSkX
	bwlr0DcPncv0z7zfspBmJvbAm5OzcyIJrfRkjzbJHzWh3DNC1KkAL6x2qsp+NgBuj
X-Gm-Gg: AYBFou011uO+i4ej++nNEHXmGde62FXG5UpwFZhePWFzpmWVPkMgDd0uipdBXgKwnyy
	ed+8Oj9KjCDX+95ltm8liEl6SVS4qMjO32P2HJy+7pRt7K49Uop3XaJraluctxexm+dO98wU5No
	8A6HCT4LEM3ONRHncqnPPZIX5CrmxR/cvw3x4HpQD3wyUAcKrqebbG4OEpSrs11rAX4Qg+1MFao
	nK1ujieN7MjvuK902XOHsVdNafFGHBsjZ+FvwGyqy1f1Kv37AAmsXmORPsAZxUe/TKw3uKC2rjT
	v4934bQ0aKw//Gq4UR183aDE0TKYdDt+VOw1Ew5hmxPI7cOAIrIyrBnIlE1fF52jW35kVV0Vvo+
	+WQiEIi6Z45tyhRgEGZioMJlMPCNMy9+wKQU8+bV8iSu5vP3hRalWIbxYbp8a1AEm9smooo0b5Q
	==
X-Received: by 2002:a05:620a:4150:b0:936:af9f:4c30 with SMTP id af79cd13be357-939ea16abecmr350861585a.25.1789115632049;
        Fri, 11 Sep 2026 01:33:52 -0700 (PDT)
X-Received: by 2002:a05:620a:4150:b0:936:af9f:4c30 with SMTP id af79cd13be357-939ea16abecmr350859885a.25.1789115631561;
        Fri, 11 Sep 2026 01:33:51 -0700 (PDT)
Received: from [192.168.16.154] (host86-149-41-185.range86-149.btcentralplus.com. [86.149.41.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e608sm4560214f8f.23.2026.09.11.01.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 01:33:50 -0700 (PDT)
Message-ID: <0b06e405f03ff521efc55ef1964726c8d8a11476.camel@oss.qualcomm.com>
Subject: Re: [PATCH 0/7] Register MPM under CPU cluster power domain to
 manage RPM notification
From: Christopher Obbard <chris.obbard@oss.qualcomm.com>
To: sneh.mankad@oss.qualcomm.com
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        konradybcio@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        maz@kernel.org, robh@kernel.org, shawn.guo@linaro.org, tglx@kernel.org,
        Dmitry Baryshkov
	 <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 09:33:49 +0100
In-Reply-To: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Proofpoint-GUID: X94GVIqg9aekt64sFgEOCGx2zmDRlYJd
X-Proofpoint-ORIG-GUID: X94GVIqg9aekt64sFgEOCGx2zmDRlYJd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDExOSBTYWx0ZWRfX9iELw3v0CZos
 WH0Ow8eFLZSB0sEmIWHT4FCLawvtU5vDQx0wbzeACeJsTSGkI9TkHdLKcC0a1n9h/EaQdw4bMVs
 at6VpMeRylvA0e8DFsEB1gMI9BEIxOk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDExOSBTYWx0ZWRfX8MyHYDgXLnjc
 U+rYENOToZjZ8jRQpu1ZC/GIrvtNaxWJDZh/A1ZH8qvdZeu1DBuEc1arGse0SLsu8luZ3HgkHfZ
 gOX3HKMSjYVPmlKMlkwcwJ9MhiMFhqFp7DF7ixSHKBraktnRtVqITt+ymfs8kW0fVK9N2MTAzKE
 zKDHaSdlGJ7h//XQnIOrWOFZXkkMm8Fe80FCA4gkTcC44vwTi4JI61NIQ1z03zBhpdozT796ICG
 qQPWxvHvc/E54VnnKu5Y4OyjHbnrGC9eCbFfDzWWjIyFl2QkzDcswehhYcN0A3PAHg+n71oVtLY
 IqkG4tLXVGqnzdOjW4a/lTj/HlQ3WIRyGQTne9Deag+M9Rls1oVArap0Z39oN8l4d5e3SY/TB1M
 ADWqWPNd96JADrcOuuyNr3MWgW6H79mEX5LzwxBjyUZKxNDm5yzc3pXs8U7jHZzo4MGKJk5rekh
 Ghh/NKw19oMp8/4j8IQ==
X-Authority-Analysis: v=2.4 cv=db0VTnXe c=1 sm=1 tr=0 ts=6aa3bcf5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=1ZqYAqmp+mGnO5v9BrvPnw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=hY6swonQLBBWNHD_PR8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110119

Hi Sneh,


> MPM irqchip needs to notify RPM (Resource Power Manager) processor to rea=
d
> the latest wake up capable interrupts when the CPU cluster is entering th=
e
> deepest idle state. This is done by sending IPC interrupt to RPM and is
> implemented as .power_off() callback by registering MPM as parent power
> domain to CPU cluster.
>=20
> Such implementation introduces a hard probe dependency between MPM irqchi=
p
> and CPU cluster power domains. That is MPM irqchip needs to finish probe
> before PSCI power domains are probed. MPM irqchip can be build as module
> and can get later inserted where as PSCI power domains is not a module.
>=20
> For in-built driver cases too PSCI domain gets probed first and later MPM
> irqchip leading to failure of CPUidle states.

..snip..


> commit af5376a77e87 ("cpuidle: psci: Transition to the faux device
> interface") transitioned cpuidle-psci to a faux device interface.
>=20
> faux_device_create() calls faux_device_create_with_groups(), which ignore=
s
> the probe return value, and destroys the device if dev->driver is not set=
.

This is no longer true, see Commit 0606f2114e2d ("cpuidle: psci: Fix
support for probe deferral by dropping the faux device").


..snip..


> Currently only 2 SoCs follow this method - Agatti and sm6375. Agatti has
> CPU cluster power domain disabled, which is why idle-states are allowed t=
o
> function there.

Please don't forget about the devices which use the SoC: For Agatti, the
RB1 (qrb2210-rb1) and Arduino UnoQ (qrb2210-arduino-imola) are both
setup
with different power domains (off-topic: I believe this is something
which can be reworked soon as the mpm driver could be in a better place
than before? Didn't check.).


> Move the RPM notification handling to the GENPD_NOTIFY_PRE_OFF callback a=
nd
> register MPM under the CPU cluster power domain.  Use runtime PM to repor=
t
> the default RPM_SUSPENDED state to genPD so that the CPU cluster power
> domain can enter low power mode.
>=20
> This will remove the dependency on probe ordering and allow individual CP=
U
> idle states, CPU cluster idle states and RPM notification to function
> properly.
>=20
> Also enable CPU and CPU cluster LPMs for Shikra.
>=20
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
> Sneh Mankad (7):
>       dt-bindings: interrupt-controller: mpm: Document power-domains prop=
erty
>       irqchip/irq-qcom-mpm: Register MPM under CPU cluster power domain
>       irqchip/irq-qcom-mpm: Prepare common access path for timer and pin =
regs
>       irqchip/irq-qcom-mpm: Program wakeup timer when CPU cluster goes to=
 LPM
>       arm64: dts: qcom: sm6375: Make MPM device as part of CPU cluster do=
main
>       arm64: dts: qcom: agatti: Do not mark MPM as power domain
>       arm64: dts: qcom: shikra: Add CPU idle states



I also noticed that patches 2 and 6 are a matched pair but sit four
patches apart. Every commit in between leaves Agatti device with no
working CPU idle and e.g. a bisect can land inside that window. Can you
move the DTS changes first?


Cheers!

Chris
