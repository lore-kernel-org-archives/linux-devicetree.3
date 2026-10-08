Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E8D39CD17
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 10:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791453717; cv=none; b=MzuA6ZIGFF5IKU8U0VM4HgX/d6vAypNsrJlgPoTjunk/F+LMOAlJivf0+0hMUqjrYYSVTwejYpFyeTZ5O/fOGTZVj4ols/n/yc9r4s30TuApEwj0grOXlYpDzepQHhCbcwCaI8iDSNz2bJiN6Kn3xs2Mk2zlB4PZG7tQigWMqes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791453717; c=relaxed/simple;
	bh=qFCsdSQW397R9Ktz9vdlbi1oo/pS+Wpq4m2m9dcs11U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D5sv6kmd5992TjFIbe09Y7b5EZX3DAp+NLbNh2HolmPT5DVeZmKjJaOiEqUGGztr9tEdiAbRUm/KVl8ZLzVyKuWc1vptObhIvXxIVSQZGyE4FsWd73ZAS1P3cAX7r6LFEhb/x3Pwe7B7nkTpRGxurRtJ3AUPUcvjNm9MOg/Whho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QsOkRHdD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aV3n0fmy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QsOkRHdD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aV3n0fmy"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987L33T2067981
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 10:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9KbmkSGdngHtw/bOKu8ijK6m2A/Y7thMIbIc1Jwfzms=; b=QsOkRHdDPkA+Y5nS
	siVFpuFDnoXKuViRwbpRTcGfcmiX3oAcjLCz6WOhUbH5vhAo20a6EShgJWIk+XZL
	3xIFt7LtCeDosJOpXH1Rv0l/2H+06m4A6t8nc0DCKHm3zE0tbe0SKS6qhpUUqyGm
	8TC5EEo58Oj6QkEKO+s5a/OEgBarEhEpkd62B0elOvS+FtzUGqYhwTlpEL5yteq3
	r6f40tq7wIouESC4PRyWDTz/VOr9MOu+7HWVskTAnaQDPGf4OORJRTRu7q/rTOoa
	yjkU3RQpyxqaJoxcgEwU9mkgmvZ2VJEpqWLFsiBA3GLh8fD/VXplFBndJxSdIgvz
	6qrmuQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3jbku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 10:01:55 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc7d2ff0087so3864296a12.0
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 03:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791453714; x=1792058514; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9KbmkSGdngHtw/bOKu8ijK6m2A/Y7thMIbIc1Jwfzms=;
        b=aV3n0fmyaTfB2+8b6baFdvWvyBQLJ3c0r5ivJW+8M7NsR7BQ+ca9ZL8hd68JJ2Ok7D
         1HNcLaJb/78m1PQ1tIFNph1IUDUFTh0XSUqdNgAQ2pUvTnmOtyDyY4Cyxlwd+iBRtf/y
         Ozh8Tul9Ba1Bw5MkEvzib0iABs61K7eELv4ax0MZUzLHrfwFwq6+W+xdTMx7XH1iaYqv
         AR/bBRp6rIDbWSzQg2Q9ORds5ER88pXRIqRKKwkTHvKDKPXULEj7YNYUb2cQalC9waXi
         myHzzdFRdhVbdBB7BJL1zLXwhLIBMO/3fJOyn3LG8gx6OGcf+atwAQd0Ns9Q5hZQd1IV
         MiBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791453714; x=1792058514;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9KbmkSGdngHtw/bOKu8ijK6m2A/Y7thMIbIc1Jwfzms=;
        b=Vjm/Gkr6vYAiUIoi3Co/+PN+W8hMC3pAKkyRBBgxuMCY0AELv488khwGwVUP5AafPo
         XVGc8F3AnwUvRxqFrWiu7ft4E/uLjmuLTtn7zze0b0OfDLZ2ekOkUDT9JQJJweLX00G6
         lLtJVSn87MNND8i5lrJ+5zFkqE2PHlayBC2qiumZHyZnIlDr0HMey+1g5WMqoicMoNJL
         Z1uBwrqGWAtYxkgk3or+vgGlFn06cVgJ5b6wTtNo3/B8ZCqUl1Hy4Y/fE71/7ALsNT98
         EMA35XOZG+W8VoWR9PpbxNwKoMLOXz+d/7ZictNnlQeViq+hNI6Q3e27RKrZT49QIB+O
         W6vg==
X-Forwarded-Encrypted: i=1; AKwUvBwLM6Ry6AaYsAaaiHjNh9NQyGW8DSmMTUktrPEB+4QF8anmYGkB3vGkeGt8YJd/Pb/UHAdrYtGlmOuj@vger.kernel.org
X-Gm-Message-State: AFuF++lPms0EsX/l+9W7WE+kRdbGiyoOHT3UijXIOiBNbAi9PIMdq/hE
	L7OR/P1IU5s7rfIS6MBlPutP6izM63WO0zocs/I7jRUZqc0YfmTbANuVLuRcQdw7Od2ltnh7zDM
	4A9CIPiW+qdva2JJZ0J3yTxZJ4yrVuAbdcEqMXJt+5a4UmvB1FDhku5GBB6J+s0BQ
X-Gm-Gg: AYBFou0drjYo0m3jj2GgfuRz4Onj9bobtuDaX9hhtNGF+4agHW2GGWSTEvpdmj9+93I
	6KN5J/8dotKKtyUoegsHJgLomFjagRcRJRm6osMVDuOsWHXjqzpCfon3x8CL5ns2BdfbpzSV1FO
	BO0AdCwakbcBTcr23IwwkSwNpyeptbnI3zsH06Tb5GrQzlZIgkzyvF2WUx8QkDyXmj+IjpX5HY6
	Y73UQdiMr+56AH1DK78wEOvOkMxK9BeczfqT8TiYmgBpX9WCNugUgb+IMfrQ1bwYlLZ3mUMy1ZT
	sN+uNDc8NnqgsI2S2BMc1Z6a0ezAzn4aE4tqB8w+aKaohgiiQ1M867hH06/xswoCU9xCOB8Ctqk
	tAMjkczERig079k18cEsht10PAD4u
X-Received: by 2002:a05:6a21:1fc8:b0:3e0:da23:874e with SMTP id adf61e73a8af0-3e13402bfddmr4304758637.21.1791453714307;
        Thu, 08 Oct 2026 03:01:54 -0700 (PDT)
X-Received: by 2002:a05:6a21:1fc8:b0:3e0:da23:874e with SMTP id adf61e73a8af0-3e13402bfddmr4304723637.21.1791453713795;
        Thu, 08 Oct 2026 03:01:53 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd0a572b40asm2767231a12.4.2026.10.08.03.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:01:53 -0700 (PDT)
Date: Thu, 8 Oct 2026 15:31:46 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco-evk: Add off timing constraints
 for vreg_l8a
Message-ID: <sd5bnurq3dkbljmuqtchnyeh2c2l7yh44yqfzwcdo2zxmzpy77@gst6dma3lzet>
References: <20261001-regulator-off-on-delay-monaco-v1-1-db0fdd69c262@oss.qualcomm.com>
 <finz2yjis56dh6ymk5vhqlndssxu52c3jt3ercvg5el2ynznkl@d3bsf5uo6jcl>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <finz2yjis56dh6ymk5vhqlndssxu52c3jt3ercvg5el2ynznkl@d3bsf5uo6jcl>
X-Authority-Analysis: v=2.4 cv=NchzRGD4 c=1 sm=1 tr=0 ts=6ac76a13 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=PunQk5y5dTRi1mTC4k4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzOSBTYWx0ZWRfX70PXgWJvet/z
 KyNUA9Ku7CzAko5fROiKorC3XOkNsUkYj6SWqOA9zYZxEEJoz+XdGAKhtmQuv3kT0GVl+FcsaGw
 5/MgWe2/oOEI+AgyZoIQ2A0av6cSVHM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzOSBTYWx0ZWRfX4ewwg4iW4K0q
 ZbgNukHa+rhZkX7kE9vRZ3fOeReGdEYDKQiKfDxSSzaxQgKkREl2eQ5hoRJR5r1eMOrS3EKH/74
 n97C9VKOGAnDrnxt8TNPL3HyrXfdCrKWf0U+5k4wNdFV+jVkoiXbvtMC74zK9996Wq8xnY3dmzm
 0a7usxQfi8udaBOnCUVIcjZwn/z/Q//BK1eMip5yS9yvsw1PwWb0KTEQoqbfjlfta71Ys2HynSI
 mZoariQf7sy98IEh/FRUbfpMGnujj7wrwNNX2oK7wjfFlCtEzu6PcXkTlm2w4UiNhT5Hc8QASNu
 7IYDvlioNwn5fBUHkfnh0ydWAUaE8DGVkrARUpOToK/lmITecNyUOAifDxMUo6lWw/E1E5Xqm1B
 HC+QyioPH5+2v0WrJ1H0IdyWRc3U07XbldPlqLZpb6KVzNEQqpmZpQSFxk4ib/ak8ieLJvhONcy
 /J0sQcDL+GIDckzaPjA==
X-Proofpoint-ORIG-GUID: WbNIBO_fcEVjmsLiStcKgdcnadmchyQr
X-Proofpoint-GUID: WbNIBO_fcEVjmsLiStcKgdcnadmchyQr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080039

On Wed, Oct 07, 2026 at 11:36:00AM +0200, Manivannan Sadhasivam wrote:
> On Thu, Oct 01, 2026 at 06:37:53PM +0530, Jishnu Prakash wrote:
> > UFS on the Monaco EVK can fail to initialize after probe deferral when
> > vreg_l8a is re-enabled before the supply has fully stabilized. This is
> > caused by the increased discharge and recharge time introduced by
> > additional board-level capacitance in the shared power supply design.
> > 
> > Add the hardware-required off-on-delay and enable-ramp-delay for
> > vreg_l8a to ensure proper power sequencing and reliable UFS
> > initialization across re-probe scenarios.
> > 
> > Additionally, set qcom,regulator-off-debounce-delay-us so that quick
> > disable/enable bounces across probe-defer retries don't power-cycle
> > the rail in hardware at all, rather than needing to wait out the full
> > off-on delay on every retry.
> > 
> 
> This last sentence gives me the impression that we only need
> 'qcom,regulator-off-debounce-delay-us' and not the other two delays.

We will need the other two as well, for the case where the reprobe happens just
after the debounce time has expired and regulator framework has applied OFF,
and now if the request for ON comes even before 10ms, it will be applied
immediately.

eg - UFS driver requested regulator off at t=0ms, the OFF request will not be
applied till t=15ms, however, if the re-probe happens at t=16ms, there will be
only 1ms between the application of the OFF (t=15ms) and ON (t=16ms). So we
need all the 3 properties, the `qcom,regulator-off-debounce-delay-us` just
ensures that we avoid frequent off/on.

Regards,
Kamal

> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்
