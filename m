Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB8232FA30
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 03:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782791568; cv=none; b=uzIxSj47OYFsZ1gk1x6oNRsuGCCcrdr+/83mdkiihKW1Rsj/giHWsqg+h59dqXNmT+41Rg7H87krPPnVcqLFSeKMQdYcrmSGAM55Z1lFN5j386TsLJO2a1iq7LJDaWAgBbUdr5ZfjYLjNO4PZK35q7NRF09Gq9ZU0NPLMAVoyrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782791568; c=relaxed/simple;
	bh=9A4vzldaBfQzALAeqt7vk2jYX8vI4TvP7smGabIAeww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VrqDUe/jRc7F5hO/VK3aPqDJVGeGi3lgzp4Os+ZJCmuEWUu6bPZCf+FMMZv2RDEfx5FowbDwcL0fleecVyv0K2kLBUHWqo7zaBjwOxIr1k9rTjaDWIEUzkAtNljdKt8ki5TBsf1KfXpNz76+JBUTce4XbAckXzEg9bw79FvGo8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xmoyhk/p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H92YZRo2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xmoyhk/p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H92YZRo2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U1Ig3i442221
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 03:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fb/t38pQXCSWtkuQETEAFyT2Aw8OK9d5iiPSYtvG7iM=; b=Xmoyhk/pujowptKV
	A6PCDoHr0AYQR4eNx7KP2Rre+2mZ2is4k/xZGgOj5+zEGK3FU+itHW4ZuKCdmN/Z
	G5SAQbTSEf2UDJfoQt74/fr9wq/zGEjY8EokD1ALk2uEsyIqZnhL/RWUqAA2NtqO
	naAv8ZnI5WkyjNDU/lzxmLxu8mrZ7xKTL5AQOM4XzAU+Tsuu4XiM0fKWgIwOiPGF
	INhJPv4wivxamyesBlyh5TJCZq87QSh36YjoxpMQhH6oySVHxW94kUXqUKfkW7ho
	QuQn7dJc+llrgezOBXNry0jso5HIVed8BdRIQ4+uT0hfI+nsY/nTlQytN2UGyu9J
	ZQAi3w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f43vfgeuh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 03:52:46 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso4722424eec.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 20:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782791566; x=1783396366; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fb/t38pQXCSWtkuQETEAFyT2Aw8OK9d5iiPSYtvG7iM=;
        b=H92YZRo26QAWlE4mfRjiTMuc3cEu5h4kA3EkHApL3VnIViUxVG72W99TcM1KVh+kPu
         Q4O9Mbc17+scYytu3/7m7yrv98L33nVlXHS8CNCICzFLB9lNTpHs3cIWd9aKY2Rkq+Nd
         cLdvckA9xLEQB1G9yRMhvKeKLn3AtVj58QZZ6dD3SaDr5Jq2tLq9qa1d+LbJkMiFNzBK
         m8twtfqa02nRWXNIdvPfiM78ciQFXMb+OxvMT1SmoaEUvZThbNrbyT/N4XFFfrJU6qbi
         pnNg+LPj+a/Dsq6bM7RAKdOl+nam6vMaM8aVVmWVftjKzbxEbvuHiQs5Wwl3zp68XR/Z
         V+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782791566; x=1783396366;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fb/t38pQXCSWtkuQETEAFyT2Aw8OK9d5iiPSYtvG7iM=;
        b=A8U7qKmD4bilLYWSj5iRMfueqqQ83EP9Htcba6ZL3kAf4fiYiu1y556IchZFlxP2qY
         iFTE402lAGN5PKsFDUYzlG6UyCWkJd4TsWxoDZhe6Zuvdot9huRTPD47dq1V2iKa1qK2
         a5io8LlOrNbVXu61Tc9yUSvOSvcYznonwwlAmMLam0jqgft/wDPT5d1Gplkq1tWvtc2T
         Bj8+GRp0g909Nv+AFpXVx+BCumyekmYmYm9nMZwWD+bDU1oEDi/YjgQG2ddXwG/wGvHs
         DhxX57sAotvv8wHmUXNMZz1BajklEVmerL5s/ot3rSfJcfThLKNcswPexC0Zo6yq0Qyc
         M62w==
X-Forwarded-Encrypted: i=1; AHgh+RoV8yo+UtOHtc8ZqqagX9iCAVhNRtI+br7E9G6KhY2G2DuOVddfvxLr+spS7t8eC0ZWyexxEgIGLFPv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2wyn/I1fTkKBuJqkSAlBEfkKuI/d2czdSBKGa00HS970Ej4Yz
	2kEXfeYf+obtB9mc9/UYiHVUmCoOfGd9VwiiMk3njBLwxkf7zWzszPByRqOLKM4CaqNu5bGHjgS
	b8kiHHLO4hIeMAIuZ2PwHiiT5Nzqm1qZ2KaMSOdNEQzyetdBuBGnX75kQaDvFwlJB
X-Gm-Gg: AfdE7cmj6W9t3SkH9Lm+loq2wg1TWLHh+7XypPZzEz2DDT6Y28qdMIEEqRFho19rSde
	ExC66K8pKRWa8tTgP7rYsNzmUpaoYhCdS7ruparBY4DwzfXV6LIjM2dpvGCx2ZiY/PW6+PwCCp2
	CWpotebCStic4ZiPWgs3UtAzkVIU3X8nDaA5JdTYz7Omg1no3gYfQiWK2jCUEGFk+ECXw7x1nh3
	UpYUPeabxFrdYhyAh5AEAh/0EAzxYHwr9Y7jRHjQxlKfGNsMQYDDE0xM8zaCiO5zx7PBsun+Nvq
	ZMkeGi5VP6T2ahvMZDy6YLvHSMze+3CTcZF5y/SPzeT76Hw7WEKS8ZyLvbQr6zKu5XZ+RRyni3e
	3S+mQO56ViYGbbRh6mo+NjQKQMhq7ovlc7oV0n2D8
X-Received: by 2002:a05:693c:2d94:b0:30c:aeeb:ed5d with SMTP id 5a478bee46e88-30ee1222260mr1462320eec.15.1782791565679;
        Mon, 29 Jun 2026 20:52:45 -0700 (PDT)
X-Received: by 2002:a05:693c:2d94:b0:30c:aeeb:ed5d with SMTP id 5a478bee46e88-30ee1222260mr1462291eec.15.1782791565091;
        Mon, 29 Jun 2026 20:52:45 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee3170ee7sm2760100eec.14.2026.06.29.20.52.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 20:52:44 -0700 (PDT)
Message-ID: <03b6afe0-937b-42ac-80f5-a1cbce0ed341@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 09:22:38 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] irqchip/qcom-pdc: Remove pdc_enable_intr() wrapper
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-3-4d8e1504ea75@oss.qualcomm.com>
 <5e59c3a3-b492-40f0-9db1-5ef9f95d77b6@packett.cool>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <5e59c3a3-b492-40f0-9db1-5ef9f95d77b6@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DCGWkqxoAHuohIYRs8h6-JItigcGa9X3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDAzMiBTYWx0ZWRfX97NgQi+JxPsc
 qMQi5+Xo7UY7parBlsb2e+s1T5wzh8luTlPqCR3idSeR8g5aRopNMNaqVlg2/eZCYAAoPiup4Cf
 azvLRYzByDdydCdbSaK5z99lpFxBaq+xMHWvqjssNlcytwgQmD3gppsbx/QvOYQGLdRMsiUUuUJ
 0oEnZyKEMuu7kdpAkARZnGDxaKv4bOD8dCGgCWQf8kBS4KktTR0V3X0bngkjnTq0h3mMxlFxghu
 F1oQS8yG+7vGNHlXhXHgbX7NVBg6fihkk5NIMBTAVqWIVZW6A8OINcvdeAD1XFvpRPUxrz/eiaQ
 risBYCTOYYn8q4OlbMKgPYavboMrrrNbLUihT+SLhG0vBtsi4e1qL9KciY+Sj7wT/XTG4uhWchR
 tQCQCOytLf0T1HI3cnET1g1yJktsWRGVqJo+qTvqGZeuMPoXG2fDFJv96KZNfcRbbxO0GxSbbPW
 66dUuvo6syv35e34mCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDAzMiBTYWx0ZWRfX+DHX5qHTTHoE
 W2aDmgQ/+u2dvoGu4zcCwaCt0ZsBBMdFBDdfB+mM66qiO9lCJ06utaRMFNuhNnOIUerBBGzrh8a
 Z4IHISthQebBYuH+o4NTgKLQregOd7o=
X-Proofpoint-GUID: DCGWkqxoAHuohIYRs8h6-JItigcGa9X3
X-Authority-Analysis: v=2.4 cv=PcXPQChd c=1 sm=1 tr=0 ts=6a433d8e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=TBjd-TfOdEHq2yxd1H0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300032



On 6/28/2026 11:24 PM, Val Packett wrote:
> 
> On 6/16/26 6:25 AM, Maulik Shah wrote:

[...]

> whoops..
> 
> [    0.197090] BUG: spinlock bad magic on CPU#7, swapper/0/1
> [    0.197104]  lock: 0xffff0001022e37b0, .magic: 00000000, .owner: <none>/-1, .owner_cpu: 0
> [    0.197122] CPU: 7 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.1.0-next-20260626-uwu+ #128 PREEMPT(full)
> [    0.197129] Hardware name: motorola Motorola Edge 30 (Tianma)/Motorola Edge 30 (Tianma), BIOS 2026.07-rc2-g432bcf301c03-dirty 07/01/2026
> [    0.197133] Call trace:
> [    0.197135]  show_stack+0x24/0x38 (C)
> [    0.197148]  __dump_stack+0x28/0x38
> [    0.197156]  dump_stack_lvl+0x7c/0xa8
> [    0.197165]  dump_stack+0x18/0x30
> [    0.197172]  spin_dump+0x7c/0x98
> [    0.197179]  do_raw_spin_lock+0xa4/0x140
> [    0.197189]  _raw_spin_lock+0x2c/0x40
> [    0.197195]  pdc_enable_intr_bank+0x40/0x128
> [    0.197201]  qcom_pdc_probe+0x3bc/0x520
> 
> Gotta also move the spinlock init to before the call to pdc_setup_pin_mapping..

Yes, Moving spinlock will be added in v4 of series.

Thanks,
Maulik
