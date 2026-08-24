Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF099372B45
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787563395; cv=none; b=kbTBL5jjUX+eTS3LEHKBrPzv1HgDpHTjm79hpOKxWCSP9/cxDNR9aWjvDFA5QbalbWvv68bwwBmK8yWuKoNY+eKGEiyfyS6vO/jtkCocweZ3R4SRufu9ViSqAI74BIdUdF55wzMk6q+CX8frLLy+Xq/6mgNkp839C91/lXe2jnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787563395; c=relaxed/simple;
	bh=fiZV015Qd6HElpgmaETT8aHHht51IUBqGIJVVF7M0Ic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZuvYV6HRTkvNqLtB2ELJDDhQqpPmeHt2fneqWvZnPJ4Tmc4Zwel1dJ+xHMnVOOtqBlwJTkhfc7+kl6J34BxZFY0YIGWWIeeFezGlDqgf6ft4zdwbCit/V1xJIjsviYGyZDYcm3quVogg9wQhNZNLEl2DvmZrt8U1XwDP9o9waAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GrJSLKeB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LaPE2bEv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GrJSLKeB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LaPE2bEv"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O98ui13109544
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:23:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JiepDIY3h187rwt4QlQW1p1AmwaHrzO3qaEhWN3lKz4=; b=GrJSLKeB61ROFGLC
	ZhbeWpOkfnERQyKK1/ciBv9Fi+d0PsfWE9ncYtd4aqRmGIjp91Ulk1oS8x1sHiF4
	K+TJFKK1fFkMZWyTvc5VmDvuKRJy3sKXCXHcm7KOq6sHeeBAzUUWmO63ePqqJyEf
	lOjMI/OfIPGB/p1glYn0J2n0B52PGT8RhNJ2uTeVO764+IY2QZxfmQI8WUz83Hqm
	KnfLDt1XbhiJzK32Bvv5S4g4QVeqzaHmjsocBxQ+LKB3NUAY/Jvfdy6mIzScoXMO
	sbmZ6/Sbtgf6VL2K2eqpeGiW+wD8cVYv7WD4nPQljhdI1euhy3A++wIBuow43suu
	HhF6VA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8jgk0aqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:23:09 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc6dd43737so62198615ad.2
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 02:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787563388; x=1788168188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JiepDIY3h187rwt4QlQW1p1AmwaHrzO3qaEhWN3lKz4=;
        b=LaPE2bEvsOe1hi8Imd//Nf9AsAQ0QW0AsEuITs64lcvF3mG4s5rDf0M7ivxiAOcHa2
         JOEy1zatxnW1rrr1fHP41lgUnX/6SZTbJrnbU/d5MI/wUVNeFPADoaMzK22QxnybqEKL
         OanmKyth+/LFIiSaGDnfrAJ4oBfzqTjiTaEU5b2/hwQs2UTzNd+xyYAFZRnS+69zMAj/
         2NLXsxXQAAqqxdaRpS5o1zNtGZQoPCKYIZaDC8nZsrD1UUJH4KrSMG6P1LfaqSkXh2UF
         k5gcGdTsvxrwSZ9vBtpZOckBviHU0NvdBvwYuwd4N+yvWV5c6MFoPjt9DkGNymTfU9lz
         jJIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787563388; x=1788168188;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JiepDIY3h187rwt4QlQW1p1AmwaHrzO3qaEhWN3lKz4=;
        b=Wg07mKrZnnzB1uihEzEBUk7h7JXoErY3KasKTJ4fN9GOlf11i1JmZv95t6QbSH/R9g
         GR06yL3QoAzF8dlAmXI/BwrUKjePI3BEP8NtVyyHCtvOG/syg/AGzn4OSB1qa8ABU8qo
         nv67fjbhBZjV4RDnzHGhaPGo6eN5oM6/gLUwej0/b/qX7QHV+w7BFJIl2L6D5nipmh7t
         TXygH0RJISYvybM8CE08NsPAVyKJ7Vs/YzPfDC0g/O5yETnrQxkcimjc6pYApMDR72mp
         XpqrhRhzfdPjDMSBjNEsZOozLy+2jJAqBic3gjiJTXHisTkYoH8Ik0qJHB9j55l0h2If
         LUOQ==
X-Forwarded-Encrypted: i=1; AHgh+RpuvYzGNktHo4T9gyVOWmqVfLgBMGSBqe49e6Gs7LiwXyMron4oYOfwq+YRkIdsLtbt+xkFL+060QVu@vger.kernel.org
X-Gm-Message-State: AFuF++nNHCGcf3NEAB+F7Szokco4zXEtSICj4B/CoQecaUCzptniZ7JJ
	hn7cbJ4E6ii/Rih6qLkliYXSWAqAyKoPIW1uozkrWRPVoZMQndjskNn+qFplGb2rRpKkzz4k95U
	C+lUV479Nm6TfTuWlwSb0iP7CqmoHzTmzyVNQdbFPz29OHgOIlPel2QHgJ+yK6vtYA92BfWQG
X-Gm-Gg: AR+sD1241lvx6v+J/vL7ESvthjZXycqbRf/bQfk7rLdvVkdQEUMTnpvqlTfZH1pDRsH
	hAxeur8Yqj297F0U/cAFAnt4ukgGHqa/SiZb5OqlSSA3uxxlAwYE11sML5FZ4HmyY+qyHTyx27a
	6bUU9RT3h7/48ZMksm2AKgJdQzwsqBfu4dLr2xgx4ihIhhhV/PxCqUUwqTPWSHHNellbZ0BPJmJ
	DRJ1BycBXslT24Qnx9ANWXz5rzDYqa37gcBflARqRzg+OfCGvYgPM6dqDnw4dwrNk07rCNxkZck
	WPa5FmzNW01wxa9pDIjy1wn19bxIA2KTyH756WxoX8xUt/J5snUu3lU+E9v8xtkVrxSi5sxem0C
	N1M3DIrX7Yja1wCQzNQgTLRaIGswnNV0=
X-Received: by 2002:a17:903:b07:b0:2d0:cc92:f7a3 with SMTP id d9443c01a7336-2d64ada8eb8mr488968795ad.2.1787563387535;
        Mon, 24 Aug 2026 02:23:07 -0700 (PDT)
X-Received: by 2002:a17:903:b07:b0:2d0:cc92:f7a3 with SMTP id d9443c01a7336-2d64ada8eb8mr488966475ad.2.1787563386539;
        Mon, 24 Aug 2026 02:23:06 -0700 (PDT)
Received: from [10.92.217.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d6768b9ad3sm15589595ad.58.2026.08.24.02.23.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 02:23:05 -0700 (PDT)
Message-ID: <a84f1764-9aa1-41c9-a560-4e0f3481f8c2@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:52:59 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: monaco: Add monaco-ac EVK board
To: Umang Chheda <umang.chheda@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohd.anwar@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, monish.chunara@oss.qualcomm.com,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
References: <20260626111301.3479559-1-umang.chheda@oss.qualcomm.com>
 <20260626111301.3479559-3-umang.chheda@oss.qualcomm.com>
Content-Language: en-US
From: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
In-Reply-To: <20260626111301.3479559-3-umang.chheda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nd1neUHp_HCn2LZxS5B3CzDM3L3aAKtd
X-Proofpoint-GUID: nd1neUHp_HCn2LZxS5B3CzDM3L3aAKtd
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA4MiBTYWx0ZWRfX6X3Fqspr3DFe
 3WeiyQ1KDznSPvF/qOs5vzA7TDumlFVSoIzwi4zJOWMmpCMhup3DzAXMUk5YHO8GS48E/srr1IR
 mJXD+rCUgGhScKHMiOLxgS8CU3Iw89g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA4MiBTYWx0ZWRfXzXRdteGkanZf
 O2QJ7Cs8P/vR/80DjacJG5ZbzjaBUrVM24ce7w6KfaPTSjufdnpw4ji19Uf5BayRRUnuzhmH0aD
 vWsAClzbYN2x3ObvwAT8EAEZ+AOxt5MOlrh1q0HzydjQ/F8p1TP11uhPx/7eXnJiHe5d+8/Pckl
 SseqK6rxImYwxileUPO9UotwGFyUDb/OxPMwA+jJ+3Uvy77up9a4D5CH1DAWmTrcFBLJjpoFzGr
 RpJml3B6agP4O60wdD9bIcZ6idIyvI5ZEuMigSqNsinFtbj93z6aBbuF+GcbZaeb4XPmeySMFdu
 2cKfolwYD0kSGjxyvsQ+K1Oj67WY7KHIPL3MRmKE4yFpFErIi9CtQW8v+jG6aUmih3mg96SRVnU
 DDsPU/xRL4AW7Vy6HnTG3/lehXdE29tKq8VCRHUMke/oqKr5mukRnGnVoTHowyCcLsZ1nKNDThG
 A6DLctv8hEyvjvP/pgg==
X-Authority-Analysis: v=2.4 cv=KcvidwYD c=1 sm=1 tr=0 ts=6a8c0d7d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=wdwvvVUDqnwxwjgyCowA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1011 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240082


On 6/26/2026 4:43 PM, Umang Chheda wrote:
> Add initial device tree support for monaco-ac EVK board,
> based on Qualcomm's monaco-ac (QCS8300-AC) variant SoC.
>
> monaco-ac EVK is single board supporting these peripherals :
>    - Storage: 1 × 128 GB UFS, micro-SD card, EEPROMs for MACs,
>      and eMMC.
>    - Audio/Video, Camera & Display ports.
>    - Connectivity: RJ45 2.5GbE, WLAN/Bluetooth, CAN/CAN-FD.
>    - PCIe ports.
>    - USB & UART ports.
>
> Compared to "monaco-evk" variant, which utilizes higher tier QCS8300-AA
> SKU (supporting 40 TOPS of NPU) and a 4-PMIC (2x PM8650AU + Maxim MAX20018
> + TI TPS6594) power delivery network (PDN) to support higher power
> requirement. This board utilizes lower tier QCS8300-AC SKU
> (Supporting 20 TOPS of NPU) and a simplified 2 PMIC(2x PM8650AU) PDN.
>
> Add support for the following components :
>    - GPI (Generic Peripheral Interface) and QUPv3-0/1
>      controllers to facilitate DMA and peripheral communication.
>    - TCA9534 I/O expander via I2C to provide 8 additional GPIO
>      lines for extended I/O functionality.
>    - USB1 controller routed to a TypeC connector in device mode to
>      support USB peripheral operations.
>    - Remoteproc subsystems for supported DSPs such as Audio DSP,
>      Compute DSP and Generic DSP, along with their corresponding
>      firmware.
>    - Configure nvmem-layout on the I2C EEPROM to store data for Ethernet
>      and other consumers.
>    - QCA8081 2.5G Ethernet PHY on port-0 and expose the
>      Ethernet MAC address via nvmem for network configuration.
>      It depends on CONFIG_QCA808X_PHY to use QCA8081 PHY.
>    - Support for the Iris video decoder, including the required
>      firmware, to enable video decoding capabilities.
>    - PCIe0 and PCIe1 controller and phy-nodes.
>    - Sound card and max98357a based I2S speaker amplifier.
>
> Written with inputs from:
>      Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com> - GPIO
>      Expander.
>      Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com> - GPI/QUP.
>      Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com> - Ethernet.
>      Monish Chunara <monish.chunara@oss.qualcomm.com> - EEPROM.
>      Swati Agarwal <swati.agarwal@oss.qualcomm.com> - USB.
>      Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com> - PCIe.
>      Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com> - Audio.
>
> Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>
> [...]
>
>
> Tested-by: Nirmesh Kumar Singh<nirmesh.singh@oss.qualcomm.com>

Best Regards,
Nirmesh Kumar Singh

