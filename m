Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCAF3A75A7
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 07:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779692814; cv=none; b=c50ks3jpgeYWr5UqPYh5whp+lGtlkdT9Mldv5Szy9EAEcrWKluv1TthLwY0JsySBF0wyRwro4csTOXsBqsvicPftFIxvEunZn7dnxMowwN4JilPrDUvtgYvF8CNTxZNXzt5btMOlqETy+6mXRjO2JqxSBZsUR6IzSWUs4KocOIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779692814; c=relaxed/simple;
	bh=hCe5dnACuZOm1TDNzmixfuaE5fDBmOyedweHcK1ETPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kZMgoTxdLte7Wu/JIkRYcBLFD2Izd3/KsqW3X9xRO45EwvlzXyziK5wYfV2QcRG4TtqvxlnymuL0oept9t1cfmTLz0uLE++H3veKzvwdEasBCDDG1cOKWMIrKTSju0OmXvvmQHuKrSYNmYW0IQWfHGDHEuIAu+bkywU6SXYpWCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EZ+zGwlg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PZ1PJxPy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EZ+zGwlg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PZ1PJxPy"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OLOlWo1779602
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 07:06:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ImreOJpx9nKlDyipy+6af8Xk5D5pUnY1RTxb+3tQZ9s=; b=EZ+zGwlgzjBnZdA4
	23+pDezy28tPuCjH/sHywCOmQsClDyS1zvTUx2S9rHgEteLJ7EEpJj5ZlBIZXrtW
	tXpJF0egqDsf8wtUoDfqhUoMYqTz7m1HRmHUgHKQ6dHa0goyDEDvNG92agy6zK2d
	MA7chArHwYn3G75OI2qzM+9MdsJt4XtbnNCXaiZXGMRRzSzUu3vP1P+1T+LW4cIs
	vdFY8xMJFBXXbr0C4y3w/VrIOhjLUh65h0l7uRgCeI/YKx2/bWPDo2LxkRXk8Ngt
	EPrKidbfUURfq99MyfCHQbdjx/fUlpFQeriGG4NJuw+cvFM6paJCkeagjpIDbvCw
	RcI4rQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ebba0vpu8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 07:06:52 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b99eb06178so213702245ad.2
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 00:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779692811; x=1780297611; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ImreOJpx9nKlDyipy+6af8Xk5D5pUnY1RTxb+3tQZ9s=;
        b=PZ1PJxPyzJQup9ETn4Mthq3BE4BofzQpoMA7PlVbWBvwOyzY1jEGCklEe0Wz7vVNui
         pZcMj/PbBG4YeQhz1iC9oJ0MQhtUN7+yB56ZRR2XqVlkbFQEg05bzSH+/ZCmS4CtcVpX
         P7zqB5/U3lXa3JpPisI8OiuQ2oTx7ID4fCSEDA0uRtrdsYJK/1JqDrocTQjvcGT6zUZS
         7iJGpyYgwN3MO3u9jlnNifCWPNivbKRKtN22jA0nvy0KhGHn49m0hk7RvuGA8zQKWPoO
         cdP+NUQAjcqO6fYh29SmirjfvsLagKgSQSLKSWHAu3D1/khUcDVOGLuArTUFbv0xCIDl
         Xkgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779692811; x=1780297611;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ImreOJpx9nKlDyipy+6af8Xk5D5pUnY1RTxb+3tQZ9s=;
        b=cCyurU6V+pQwf6W5wgLciDYeeb3nl49CtE1XkDT1avZ7umVaIMByYiWaXN0IhYoJnU
         DjQ7oY5zU7Bzv8UcLHTmdV7+VcwWgsRTucyz6rNEuvs+bN3R9UBHHKk4/ZmzvtYRvgAo
         9o8KMuT/ETp+tmtSDH9I4oIwigN19cJkVWp6C+Q4R77awPkSma897E1BSaBXg0SewbgR
         kb1WKXg3oErOxWhuMv0VyiKiC/YhW0MkR5eFtsFfbBOLjh3X30Yyuq8uRU8B3hl6GQd7
         hzrP7u6PM4TLQFp3vJUT8JHm4wDQJOCG1ByHTIgT6X0503+LpaKt35DeBBX69mxLcifK
         it7Q==
X-Forwarded-Encrypted: i=1; AFNElJ9uP3MXWQc92oIV3okFYKF31SdP12K+IaGEx6Kat8sDaz4hFq6l6acjVBBarIPgvbe7zDbdIR5jMu63@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+q+bsCSUrBOxdScmgo5FgtFVHROxS+UfcKOEM0onc+/PK1don
	QixiQBNGUHgTBOWpbPVBv32m0Etg32BnK6iWTCERw3wCBAA2joEZilcXnqZQbEKtPQ2YeFpobFl
	trfZtAMtd3+1UQedq2X9xyit7utH6dtsumRxDgIJP8d3rcJOygVJ23QtyBXj5edVB
X-Gm-Gg: Acq92OF/VCLs/AoTNlNUPJiImU3/jz3zKTbeXsuJWrPhudXFhvwzwIYLs1sdU6nADHr
	jTdHQobguRvJ8y9A3sOuB9jLiY+hEhUy+9lsET6GjY9Y37ao4mmolXpRmdz0fI8KuDuQRneaIoF
	cqnFSkVdkf5cCYsNbQa98R7TrsIgQ1FjpdGHQ8Fpbki4ZZu74ZsvOlCkqX9diYbxLurDV6Cjbtr
	W32D7KIVkM87XEG72zD19KCYRTkGYXcuaZxcZQfpXhaBNl22a19Zsn6FJzHD8g8TKqF/72L6XWV
	1ITABv/6iYQ7+oJKkxgf6Xuo5psLueyXf2z6UFXVkiHj7OV/f2H0ycZUyUumH1AQQX5vtmbJtQt
	j0DYXGTzOrqEtnQO+RCshi/prp4yXkgxLTYeD5tNiJtut4F/Y1La+geVZpKdntGEJaVeuKw==
X-Received: by 2002:a17:903:1212:b0:2bd:4d9e:ab27 with SMTP id d9443c01a7336-2beb05822d6mr148296945ad.17.1779692811471;
        Mon, 25 May 2026 00:06:51 -0700 (PDT)
X-Received: by 2002:a17:903:1212:b0:2bd:4d9e:ab27 with SMTP id d9443c01a7336-2beb05822d6mr148296545ad.17.1779692810948;
        Mon, 25 May 2026 00:06:50 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b387dsm87575635ad.50.2026.05.25.00.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 00:06:50 -0700 (PDT)
Date: Mon, 25 May 2026 12:36:43 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v9 0/5] Enable ICE clock scaling
Message-ID: <ahP1A1K/EXujoFuB@hu-arakshit-hyd.qualcomm.com>
References: <20260525-enable-ice-clock-scaling-v9-0-c84613e9ce47@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260525-enable-ice-clock-scaling-v9-0-c84613e9ce47@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: yfAl5GwmP6zW5M5qxF3oLJ-NaP5ntKG4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA2OSBTYWx0ZWRfX6JwOVs3gMu2R
 xxm4RixS2dGoFNYfxAYFy+LItIorg1aQQCgCydQIscUaeAFJPS5hE8X+H4L6waPt3c+tnlFtxDt
 HtUJw1/b+SYZ0+sHe/WQH8hut9RskyjDWNPxtReuYWCJfL9F98F4/Z8zmfOHm/QkVsL6+7caopY
 Y49uLwDVPH/W17ifjtkJB+Mhf8F9Nc6Bei89qd/nkZ3UPlXWDEbmh4nBjRrqnACk2q586hT8Dia
 1c/QgBthTc3A4tECkxwLCbCEZAEiusMw1F6OP/frA+uNMJxzYZsQM8CFUhP1aQIp0WOEnKbY7as
 vADsB/fJTnDE9X3q0chm2TI5KyedWPRPGquEdfVjtKN+kc4G5GENPOrsI5Lb9lhzjfiSZbK6X5T
 dBQxSK/ATpjvS5rIhN2/Z1o4SvdSWfx23JX6tnd4WFGZOnT+h5UcEW6wQ8t02RyLc0JXhPhICdx
 CDHJTLl7RzQGQE8LbRA==
X-Proofpoint-GUID: yfAl5GwmP6zW5M5qxF3oLJ-NaP5ntKG4
X-Authority-Analysis: v=2.4 cv=Xca5Co55 c=1 sm=1 tr=0 ts=6a13f50c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=p6yxZNB5brmi-_xxTTcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250069

On Mon, May 25, 2026 at 12:55:47AM +0530, Abhinaba Rakshit wrote:
> Introduce support for dynamic clock scaling of the ICE (Inline Crypto Engine)
> using the OPP framework. During ICE device probe, the driver now attempts to
> parse an optional OPP table from the ICE-specific device tree node for 
> DVFS-aware operations. API qcom_ice_scale_clk is exposed by ICE driver
> and is invoked by UFS host controller driver in response to clock scaling
> requests, ensuring coordination between ICE and host controller.
> 
> For MMC controllers that do not support clock scaling, the ICE clock frequency
> is kept aligned with the MMC controller’s clock rate (TURBO) to ensure
> consistent operation.
> 
> Dynamic clock scaling based on OPP tables enables better power-performance
> trade-offs. By adjusting ICE clock frequencies according to workload and power
> constraints, the system can achieve higher throughput when needed and 
> reduce power consumption during idle or low-load conditions.
> 
> The OPP table remains optional, absence of the table will not cause
> probe failure. However, in the absence of an OPP table, ICE clocks will
> remain at their default rates, which may limit performance under
> high-load scenarios or prevent performance optimizations during idle periods.
> 
> Testing:
> * dtbs_check
> * Validated on Rb3Gen2 and qcs8300-ride-sx
> 
> Merge Order and Dependencies
> ============================
> 
> Patch 2 is dependent on patch 1 for the qcom_ice_scale_clk API to be available.
> Patch 3 is dependent on patch 1 for the qcom_ice_scale_clk API to be available.
> 
> Due to dependency, all patches should go through Qcom SoC tree.
> 
> This patchset supersedes earlier ICE clock scaling series (v1–v8) with updated dependencies.
> Hence, this patchset also *Depends-On* the following patchseries:
> 
> [1] Add explicit clock vote and enable power-domain for QCOM-ICE
>     https://lore.kernel.org/all/20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com/
> 
> [2] Enable Inline crypto engine for kodiak and monaco
>     https://lore.kernel.org/all/20260310113557.348502-1-neeraj.soni@oss.qualcomm.com/
> 
> [3] Enable iface clock and power domain for kodiak and monaco ice sdhc
>     https://lore.kernel.org/linux-arm-msm/20260409-ice_emmc_clock_addition-v2-0-90bbcc057361@oss.qualcomm.com/
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
> Changes in v9: 
> - Kodiak ICE eMMC OPP-table entry corresponding to 300MHz is updated with SVS_L1.
> - Add 75MHz for Monaco ICE eMMC OPP-table.
> - Fix error handling and initialization of has_opp variable.
> - Pass ULONG_MAX as target freq instead of INT_MAX from sdhci_ice_init as it better adjusts the data-type of
>   the function qcom_ice_scale_clk.
> - Link to v8: https://lore.kernel.org/r/20260409-enable-ice-clock-scaling-v8-0-ca1129798606@oss.qualcomm.com

Hello,

It appears that some of the dependencies for this patch series have already been picked,
and there have also been recent changes in the ICE driver that conflict with my patches.

Please avoid picking this patch series for now. I will post a new version based on the
tip of linux-next, with the ICE driver conflicts resolved.

Abhinaba Rakshit
