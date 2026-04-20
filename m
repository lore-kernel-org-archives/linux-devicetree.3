Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D33388379
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 08:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776673989; cv=none; b=W0PWo0TJ0Xe3E3nJG3gtD1XEiopwGNGZIpR1EMbeY96k27GEocNrT/XiLY1Vd3N13E/vgrdBLqray+PMlgi/85xR1qAg9GWb5Thgok31zrKnqQgnuwnEYuRysNCoxt+35Wk8WvYTkLygZMmNfbD2U1eiDa3JkeXn4EwA5a4NmJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776673989; c=relaxed/simple;
	bh=qCMhl8v23mKSySIuzoFXuza/KKVO+dL9EsOEBALwnLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bFhznDIgxyZ0OLWIgRwjIFUq1ChHBbTHTIdkLAL7ANF2IYHgXM9D1tjsXXoTLchKobZlq6BtCUj/mz9pDcNftSqa9ru6CUCcsLnsfbEQFiGEL34hDEox0roBb6IiMiwY7DBLoutRIufIsVW1+n7feNXugb7YGVDIrTQL+BThCO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UYA5jTOi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CGtTKbDa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UYA5jTOi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CGtTKbDa"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K7WtsC1532102
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 08:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O81xam1nsGBvqU0gdhFfes6fttpoZWd8T+X9hUECIeQ=; b=UYA5jTOilVCs6BKR
	c5XgYT1dwKRawwilfcV4+RziOQrQGwDQSaNfkBakV4ahU5oLeuKON16t6QYCo9qG
	0CPpCnxkX4Y+WeUcWHqy8AWIvA2NkxkQyVHtBaIir0QhxzKQPTk3DwlPV7RY0dg/
	YcOeXJP6Phnf6qulYtdDBOvXEof3jU6jhGm3jEJg7mIJ8eRJ5pdT3QMDi9ymjvcd
	xfIrt1UMyM5IqJAgVQTrWZFDn8O0tSyttctHuao0DVZcXVW3qgoiHz/CXsrX91fI
	9qyo66vP6PeNmhcdraBTCzggnbzc4ndUVIFPaKciHhJap54VCIKLBpBH8/1Rdhh2
	r06AHA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfus0ckg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 08:33:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8eb6880430dso15669685a.2
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 01:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776673985; x=1777278785; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O81xam1nsGBvqU0gdhFfes6fttpoZWd8T+X9hUECIeQ=;
        b=CGtTKbDaNibcxEGwz8q0VX0szQGe4qUAj0mx7oinnc0YFSB4QbK8P2YyIMxp/C2TdE
         E48UOlXHuBbbs4/XkColhKMp7ciZAKNjJekh5qJapjV72tm3wGdJlbj+oGZ/VAtykren
         9L+q06LU9JAY7aQVMCMkB3HyOThsZnlurm3bIlMNitDRYQjRxviJoCtE9NpJdlSTsPCc
         6oOe46MDOkKuxCSAkWE9K19JqaPhPGIZ8NY8H6ABAKRL46Ou48Iw5LFvwYqxhFFPB0Ao
         ByR9IgHyyVdmZ7KUJyJCa4V0KlcLHr27GrRlOO8k6p2dHWR64M0BoPVrelKwh84Efa+A
         k7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776673985; x=1777278785;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O81xam1nsGBvqU0gdhFfes6fttpoZWd8T+X9hUECIeQ=;
        b=AxwPIqa9eRMWS+7FG77DlMg0264vJJUJm0inpJBuaTm2pYk0xwuq7sNn3RVO5bAUhm
         vgabsfDpL8vcIo2N8rbqZOFpFwK9Lt0K3ZpZYRGJqpE936F8FxQ4u7bH+/mGt0EjKRDg
         X3OYAsRP14g9WSuKmgydTjua474xH6sm4/YaWSqB5RUfZlwFGKV1vgSCNB4irqhgakos
         w1YrrWPgJg/0ioiP9n/zr2TD7b5r+vTRSs/mKg7zJIyrLwYFHWW74WXp4WOdpzYINf0Z
         4+yC9+biInb2nTlZ22xoBnVtNqzWwuiXAeOIvJMrEvPEVKZbKLGbSEGMUnXFKjx/+2VO
         SOgA==
X-Forwarded-Encrypted: i=1; AFNElJ9tzTAgl96zxjRPri1wTUcbuG54gN/AFIjSu5yOYGABA/0mAu2uOZ01tWK6hVcgHD52cYPP9HppLGnV@vger.kernel.org
X-Gm-Message-State: AOJu0YwINCjhK/1eNSg9+0MpGbWDUkaeKJrcH1Q3RYw+QeEY0KjMLZF4
	HrVPff/7jzNp+67t++WYoCkEMWvVKl2PYJDQf+PorMXfRoRxDlmHH/YO15Jh76gRbS+KDOZHWJZ
	KdBtBQ6rJC05+d7Fud83xnkANms8Y5xUnfIYmgT0gKKC7+IMASCrq7EeH7QEauDc2
X-Gm-Gg: AeBDievV7vrrJTLsrQgus5VRW2+d3rj+2wgirGeiv6y6Ze3jK5rXOGjO+ouDHUTA6X1
	98sWvNEkHdYUwD4JcWYFrOhpIneWLrzxN15TH2MrVSspwyYDALrAsOhBjiBchz7wfRUkdxF33Sc
	3+1uX5MyoYFhh0lQ8yy2Pj2ktHmpyxAf12d7yv6VaZmOGjzcWh3c2VtuZuqrNMe3DV7zRQQLnMd
	fkngxxCxLm2TCyZ0YjiNioI2EdoVT8UyX0Kyj1wtCwcw/jm29BA18PnruYUzA9Mf7Y2UsP6v1Js
	LnVu4HSSZbUHaU6PwR+iYlOMXl92xfvk0Er4WHa2vphBIZNY7WNHIhXoXLraX26DSDG56E4sQbj
	HpmBILK1oYZ7SQ5rqHkw4NFuqOUl1L07YKKWjAvFVOI1nQ+H28Kbk6zkg/Kbp9hvRi16zc2iVQd
	2SGUc+BIUJGtm9ow==
X-Received: by 2002:a05:620a:4694:b0:8d7:a89d:958a with SMTP id af79cd13be357-8e791c8e121mr1183543285a.6.1776673985365;
        Mon, 20 Apr 2026 01:33:05 -0700 (PDT)
X-Received: by 2002:a05:620a:4694:b0:8d7:a89d:958a with SMTP id af79cd13be357-8e791c8e121mr1183541485a.6.1776673984903;
        Mon, 20 Apr 2026 01:33:04 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-674b7639494sm658448a12.13.2026.04.20.01.33.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 01:33:04 -0700 (PDT)
Message-ID: <014b2a76-074d-4454-8a58-7cee7e9c044f@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 10:33:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc8280xp: gaokun3: correct EC
 interrupt pin
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260419173251.1180026-1-mitltlatltl@gmail.com>
 <20260419173251.1180026-2-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260419173251.1180026-2-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA4MSBTYWx0ZWRfX0zWFPaT4CHi5
 f0g2oeTVEsZKWanGwq2AJjRxy3+nkONpjshWnfCGHbOJxvEjcYPUBziLMeYmzrHgmaCijkDkWlI
 /Lqe2TGG7EpGA3EBwXtRHjK0LL1TpwbEF2VnGjylg2ZDuRjrRzCRyCKxq4DL565gbYQgImqJh27
 TfBXlp3QCri2c8dqc5PCk5wddpHlxIzz6k3NUBUlEESff9mHYSTFWcr4mitslSJSjfXawdBtnWo
 ZcgE/ykv8X/47cK0klM12ntRnWCD/Cg/madENuBmp6i20i3depDhfbA1XZSSC+ofzdDyT2LvdFc
 7tvce/0uKz8PYp4d88lWa/xBATDHx0E2DK4ogGIGOfMzXcmCr7qkdNnSp6dLkDZTM4LF+txWhMq
 YnqB3xW+rmvBUfg2wVbktLLI6y/nDjUSKoqG7UEkdy+NxybUQzPw5CNR/MU7L67bLtQvbmq+FDW
 Ipf4kVArQvU2FUHVLiw==
X-Proofpoint-GUID: R46CxjgjXv2u-v0vnQn2iW4HWP1YUa2b
X-Authority-Analysis: v=2.4 cv=PMQ/P/qC c=1 sm=1 tr=0 ts=69e5e4c2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=ttdWN3qaAAAA:20 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=bcNnqL9biuxzk6TNqmIA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: R46CxjgjXv2u-v0vnQn2iW4HWP1YUa2b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200081

On 4/19/26 7:32 PM, Pengyu Luo wrote:
> Unlike other sc8280xp platforms, on this platform, in dsdt, gpio 0x2c0
> is not mapped to gpio107, it is gpio103, so fix it. I found this until
> I did a trigger track, irq is regularly triggerd every several
> millisecs. In the past, since here gpio107 was low forever, ec irq
> would keep to be triggered and polling the event every several
> millisecs.
> 
> About how to get the map, please check openbsd driver for it
> https://github.com/openbsd/src/blob/master/sys/dev/acpi/qcgpio.c
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
