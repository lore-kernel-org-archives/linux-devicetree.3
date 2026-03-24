Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA993E0C54
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 09:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774345042; cv=none; b=TnNw/RB0ajNGhyn2ywKX3j+DAu/ygAWCBMfeyg1Pz3KhIhDvvP9WWUhq58nM1xBUEiBjcyDLrerVPsoVEY2O/v4dE7pryQEchqWh3eC1hChJXZiF4q5QGFmIa3IS+7Ch2F+t9TBadNLbcLvXSi4zxJ6smtVEUUgtSOWHTrqDV3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774345042; c=relaxed/simple;
	bh=eZLFQfv5y1YWafFhvVrbhSW/9AxjMMQ+qGknRyNtU50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mJW8yx5G2wsq1sdX6d2OXMYTiKxJRIdCY6osklmQdkWKU5qjW+Y7q7i31SCO8LGNQ0U8pwPyLw7a3P32EpPdGxJjLMUOfB/XTNx46Q5b9QLkwAnWx0d35BXg/rVOA4QGNGdXKSrixi7dqVqVRK5VXiTeU3RafEjw8sZLdOX9rRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WxN3t54c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Opco2pbF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WxN3t54c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Opco2pbF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O49rqm1908753
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 09:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s2MkWw3hVOByC/T8S4azqYuB+yiA+zLaDqFYouaj7bI=; b=WxN3t54c1D4hnrqO
	m8BT14qd2r+obUGGhF3jaMcyNz3OE8Eq+HwLnvG8pt8rsggDJBzm3n2Ij+f4Fwf7
	R5n533D01+9cNTG0P/UorZeYjivvgsHCY8uvAFaLQwrBm2f/nwcIVrPu9h0yJVio
	dRo/TXaV6it9KhEuESZiIirvxefkfsVEIHbzIRuUrkGoseYrHfnf5CPOWXJKH5a/
	1sIAAA1kgtaveR4rzRsl+qA7Czkg0XiP2B/pUFWAeLeQbV2JrWtFqUAtmCmhKK53
	8N+QJzEZS+Mv5TSU0nJDYTu8rzMfjISlUZiZvI0dZur3RqBMlA5kBorEdKNoy4i8
	whPzFQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3awytscy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 09:37:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb456d53a5so359495985a.2
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 02:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774345039; x=1774949839; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s2MkWw3hVOByC/T8S4azqYuB+yiA+zLaDqFYouaj7bI=;
        b=Opco2pbFFfkok83gJd+Pvn3iULPBwmMonohhKjWiNYxGqUlVJ3Yo49XIXVxK0/ydzn
         GSu69j2OriL7nv5btoIMtJ6LeSm2p+zqRHI5FhmQwXwOKEUpfnVKgI81ctGlmBmmxBn+
         dBBT7VoDA5Wa2VYRsQYr6lmsJiyv07yeiSaOCbLU3kekq/7t/X6kOexD1MGgKarbmJcB
         s5lEpne10ifDcz8vEyHorvX+gx7ftpuBBg23QzEOquZOvCZsGQroM98MBx9/XxX7o+4m
         PissSmkU+O5D4q2FbcApWuFF4rtZzETUKA6bCS2LqzfxTaT6os/wunQnqj4/JSO4PWzo
         VnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774345039; x=1774949839;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s2MkWw3hVOByC/T8S4azqYuB+yiA+zLaDqFYouaj7bI=;
        b=gNuSi6m/GtvaBKvINwVxpE8F71AQcp9pkMot+Y1UDKaZCSWIjZcAdlpWo6xgAVmD2V
         C7GGVTq3J2EssHlLpKGwW/ys0YPz1YEQzm3uCPmMRtu+I/H1bjK44z3UQfH3+2eIYa2f
         CSKcYiazHLi3pTlShk+eCOYo3qv7ncIm/PYxjzYKbXPIIjaZTdqFyL9O2lDOOl+FI2YV
         E6zKRJt+QvcxkdT7P8XspNrw47xgpP08TPqSQB0gpB24nPUrDEuV8DSgar0lXZWp1DkZ
         zEUV3JfuNfLIhDy5nejGiHALOBT13hJZhJ/SpfPMSuZE6J6mo1bVj8wU/bdqSgVEl0S/
         UfhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKMOjgqzoD2LMB3rVcarDS4j+AkgOJwscuClbFbGWHX8CMp4t59v/DIpZi1C/ZlhxZwk1Aytw73896@vger.kernel.org
X-Gm-Message-State: AOJu0YyvmiIM4MD/SoWj6cZo0tpSmJQKakpnxwjygSaqWlW5JM9HbLoo
	wZstszQNjOodpt3wjJ3MyICNzfSbOgza43S0nBF8Ii/Pl2zH9uEXDBQsRojYgZdC0svEn6ofXMr
	cpdb/1FTYud5ZuePvGyS6ta3utx2pgWRZzp8p8c9+pGJ9n+OnMuPTIN/Vyz4eep6f
X-Gm-Gg: ATEYQzxLvf56S3OazJ96qM+vzIgIlVuupIM5P+OAXo2tHR7BLWnDl9UjV9QXHLzUjbh
	SqoEpAaRiRkmzhBJuyWoNXP6xHRdPIenQvG4JTBvgzCbCmPJrrrBtFNdNqubT8uVGzqnCBx/B9M
	aRAXktrQsBrO1gF70rXP2t4ekWA4GoltPfkNAFYfryJbhnoatl+kf0sv+ggwKouJD77JPGyt/d2
	VSCc+j1nslVEQ1ws2HfEXhvhMXmNKoW/XGpLezbXmQaXs9627IcHj0sSrz2Fqxvmm7FNB6hPqav
	Sjm2tm79JfByOysK0CXh3HYGJgIakBuU60ocAJ+H0IHcaLwNywqNKUluYzc0Wg5dMzZc0StpM/H
	0/Ud9u1GK/iNNBrcdmbJnVrrv0sxV6iNms6Nd6WRikaE4a+YjuFUmt3MbDSYfis0Gq+2D5TXal7
	B55XI=
X-Received: by 2002:a05:620a:46ac:b0:8cd:8c81:4b1c with SMTP id af79cd13be357-8cfc80ca448mr1473762885a.9.1774345038967;
        Tue, 24 Mar 2026 02:37:18 -0700 (PDT)
X-Received: by 2002:a05:620a:46ac:b0:8cd:8c81:4b1c with SMTP id af79cd13be357-8cfc80ca448mr1473760985a.9.1774345038471;
        Tue, 24 Mar 2026 02:37:18 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66a36996b12sm460342a12.25.2026.03.24.02.37.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 02:37:17 -0700 (PDT)
Message-ID: <774ef0b6-e3c9-4613-967f-617ff03adb7c@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 10:37:15 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs6490-rb3gen2: Enable uPD720201
 and GL3590
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260323-rb3gen2-upd-gl3590-v2-1-073514bf9ed5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-rb3gen2-upd-gl3590-v2-1-073514bf9ed5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3NiBTYWx0ZWRfX6asP3MWS3lWi
 MTMLvvcyP1AIfsTPF/TEGZFG1NGWyVcBS34ESZ6mUnPx0hfg+Dea5Tu5u7ubGKvEOqNP/Lohazk
 JzksRklN2f5tggM2UxydrOPSnoApY3kNrO1mlI2fu+ce73ncOce0+vR7ja3xo/Kecsd5iNo87Mk
 AOo7sVL85aMZXM2+I+npkL2K6XVAE8dnQoZL5UA+DH2w4eHNOsalJxaLmdsIrkCr+tBdrUfZNcY
 lru99uJV5Lq2KC9v2urCcSJpbUMJnEmxAiRr6/5ReGRt1SZqXE8E+XjuujUZibdgHGY18Yc8L+J
 O92eV/taRjL6WjHB94LPSFiNChgA/XpHQuNfjNXInRvOnahZI7ECFBz9PZg8CyzcJiRqZMT2Ufb
 6MUN+W8Nfd03kxbjg8E1WpW5N2SEeqMAgasyGbm+px71QSEYF0oGTIRtK0pYDStQWYW2qJd8++o
 w7ahjcGaTHaTcj8WfYA==
X-Proofpoint-ORIG-GUID: 4sV534EyutRHn8JCG4oBLVhyjrPch7NR
X-Authority-Analysis: v=2.4 cv=KuhAGGWN c=1 sm=1 tr=0 ts=69c25b4f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=A4rZZFmT0VfpKD8yd_UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 4sV534EyutRHn8JCG4oBLVhyjrPch7NR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240076

On 3/24/26 3:32 AM, Bjorn Andersson wrote:
> The QCS6490 Rb3Gen2 has a Renesas μPD720201 XHCI controller hanging off
> the TC9563 PCIe switch, on this a Genesys Logic GL3590 USB hub provides
> two USB Type-A ports and an ASIX AX88179 USB 3.0 Gigabit Ethernet
> interface.
> 
> The Renesas chip is powered by two regulators controlled through PM7250B
> GPIOs 1 and 4, and the power/reset pin is pulled down by PM8350C GPIO 4.
> The Genesys chip power is always-on, but the reset pin is controlled
> through TLMM GPIO 162.
> 
> Describe the Renesas chip on the PCIe bus, with supplies and reset, to
> allow it to be brought out of reset and discovered. Then describe the
> two peers of the USB hub, with its reset GPIO, to allow this to be
> brought out of reset.
> 
> The USB Type-A connectors are not described, as they are in no regard
> controlled by the operating system.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
> Dependencies has now landed, so this provides USB Type-A and Ethernet
> support (when renesas_usb_fw.mem) is present.
> 
> Missing from the RFC/v1 description was the mentioning that unless I
> pass "pcie_aspm=off" to the kernel, the Renesas controller fails with:
> 
>   xhci-pci-renesas 0001:04:00.0: Abort failed to stop command ring: -110

+Mani another quirky piece of hw, perhaps?
Maybe +Krishna has the datasheet. does the it talk about ASPM?

Konrad
