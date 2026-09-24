Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A820C3AC0C8
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 09:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790243690; cv=none; b=st23mhQeiPam6Z0ISoQFumNVx2ElXOA9fTLQ6OEzykfT8NtZdEbn4xGHoxvjeomOF5JX6Xup1k0se7g32+KsIMUv6nwByDUQKn+m9JjQiJ1RAgpNyrCv+QKek6qq50ILzoDH9udbdGxfk0fuwIdqWoRfxYsJuHelmQcBzFvsplY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790243690; c=relaxed/simple;
	bh=GCqtV7gztwacl1wtluzqhR3Rrfm+XRlmEFzBMnqYPH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rmhaVy2oYvdgFtPnJBqul4t3gBnSDctQaCdahVGwzOcGttmLB7PrPPcXPTZK5jHDaO20IyxJYgZHB7IicDtMGX6IHthvA53vTP/FDqfeIYOktyrIj9xpdRmwN42cNRP2hk5F8zWzAqjQempEEmgIZRgS0k3LXvjO8fT5PZ+9ar0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZKC5m7Xe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QwSCTjGA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZKC5m7Xe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QwSCTjGA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PAPv1923873
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 09:54:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pV86+SxpwWf0AIExCaUJX5mz
	1KnFAgW0PzRtHkqTKtY=; b=ZKC5m7XexAj1uVzerlg6Mt0TSm+38PkS1V+9Qt4Y
	YElhKNRlrSX159eOOMp940PNXHR1HW3yWxMnqntsD1EfPSSEaMdPSaLB6uTGnam1
	qNy6LdE7MQixUhdCO4v6dcdzFxKeZQKJlttNeV2kx2kQlhOQfjSYVM/DOTtbAIos
	qzeRQjCJ79e8jBRYHN9fpYU5qHM9RV3FVioxSBGQFB9ZuIfeiU0Cz6ImDVjpWlAT
	lZSRPtNK/NJ9UI/wueJHwS1PLCiy4nJYE4P80GWTt3sikVa6lrnjjp32TECWIELk
	mCIJSOAhWg5eY5Izqpa+Symgr8rqATajL8VbSuMtWmA+mA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvx8agw0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 09:54:41 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33310847fcaso3401847eec.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 02:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790243681; x=1790848481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pV86+SxpwWf0AIExCaUJX5mz1KnFAgW0PzRtHkqTKtY=;
        b=QwSCTjGAgip23HmAKQqzAGUGexwZKfQciG/rhjQmeAayw2J8XOrhuzhdnlnt1O9bR+
         Lr9FoH7UhOcnjLOJeuKxX2eoJETgr+xWn5f38EC1wdKkguGUckfyQG4I6HnlbB999BGQ
         sN1VF5Dzb6+tzzrhgi2DSGhBbVW5kq/eqrE+eOZaIVYFd/nKm6TYZfB6CbLk70fIbNea
         SVnMbTrptaSLsTZUbMqHrSeVUJhJaCZ+VfQxC0Sv6xXLn6fX0LLyWHzod1SiYfJW6djy
         ULSbYqiA2ssFpqRWSTI+7P8XGBXSPoaOlJDX/uhB7ef/Gr0IftaoXX35V8/icj3nCNNb
         J2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790243681; x=1790848481;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pV86+SxpwWf0AIExCaUJX5mz1KnFAgW0PzRtHkqTKtY=;
        b=g8AYNbQNdHCXgRz8dCdjqcvdjc5HfyMgeLWSI5iYuS3rnGMpJdbvEFcPXNHnmCu3C4
         bLNV0UkGDfnssQQITr76fpF7um8PW4fFdD1EDZx2bifdYmVLu7Nc/toTCBkhkNzhPCGV
         BKip1aZ2bHGgxDsTuZshIvGdBuxk7SRLQfk8I1jb+P6G6ZzT8rsPfBecnXd8xFAdzrvM
         2rugXRxOmp9YO8Y/Rygo5n+CvkrH3Syp9S35XXdQV0nooA1RqZa/cXiYarpROt6Rqj5V
         9PcsJB+mg9FKg4LbTc9dWdSBWZ6QLG0VaFVAb0Ev70W24meLNdp10Vv/1OzwSBbazDK8
         JakQ==
X-Forwarded-Encrypted: i=1; AKwUvBzprXFMTWifi0Ej6PvIDYwtAhvg8x4bl4I/SmiKW4HXrZ/Xr4uWatZ7CKMUZC6P5+cMsRwsLDTIqHOZ@vger.kernel.org
X-Gm-Message-State: AFuF++nN/910nIeOUwaTVol2ZnRjwb5ZNUtKEvkK9l9a3jzca1waV882
	4xukLadq6HCpW3wMjMqWIhaP0zEv95UwPGtajXMOuia9nqJ2YniDfbFu2eQk2aKSwbb4/CS+HZf
	lKwT+m7ZT06NMDOLMLRmxfLZOc1b6TwOqnc4m0bC9FQDt978OLgyB14YoB+dtSQ5x
X-Gm-Gg: AYBFou2G0ujjMXgehmxaSv988HQy9CvJxrHEEmm6Ue76crMT4o+E5R7gli1NSX4ugXg
	SA5lavKotfIVYa343qonSj/bC0jAViKSFq/9zv1718iGELchAFaytfVwamLjO4TcUm/aK76djkx
	+5Q9OqbWgqnsq8fh9pOGMG5vuopUeDUR0Id8xVxfm6gi2zUuK9rJJ06K3mgeAvJHZhX8sBm2YI8
	M4scrKKpmN+RsjsIApI86B7a/1cHedZTata6aQDbkqFsUahwTxg5fUl42vvdLT1slaUzsY90Zzi
	QJtWErGlIGRbMckenrfCzkWFYrP0h9YyfTxjakNYNlgyTclRMD8hdIvseN+lrTL9Ib2vpbv7W5l
	Z/IZw6x2KdB9WuZvj0xdsqAvLnkB8NyHkuJeUtCDTzA==
X-Received: by 2002:a05:7301:618d:10b0:33c:342b:3742 with SMTP id 5a478bee46e88-33ffed51545mr1450926eec.12.1790243681138;
        Thu, 24 Sep 2026 02:54:41 -0700 (PDT)
X-Received: by 2002:a05:7301:618d:10b0:33c:342b:3742 with SMTP id 5a478bee46e88-33ffed51545mr1450900eec.12.1790243680436;
        Thu, 24 Sep 2026 02:54:40 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9625921asm12706547eec.15.2026.09.24.02.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:54:40 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:54:34 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: nord: Add adreno SMMU nodes
Message-ID: <arTzWkL9kTaESj9s@QCOM-aGQu4IUr3Y>
References: <20260924084805.1021758-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924084805.1021758-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0MSBTYWx0ZWRfXwGgaZWDqpgSD
 dn8IwukznkD1Xi/lNVnLj/sfT0ntmmIg2B0uS3SREWvVIWMcyaekiZzoq9xT2pDxrtZZdSjxxDz
 MkzScMLfIJX4X9UgmFakrCGWbROdVFM=
X-Proofpoint-ORIG-GUID: 4HfyBRnQsdJ_Kb5qpUfOzNSqRa0xd6Oq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0MSBTYWx0ZWRfXzkPRMKZycT0q
 ++9ZXczeY6vsEQF5zu5PzZAkui6dpNpBNYGQVLmHZsjfOMvVQsc1pnmvNQjpA34xTVO3zWySRbb
 Bl6uasOIu+/kc7fbN3VLlEoELldEkE4Pfyjpjpz118CpqwtM8s2vxVovDyjHCgZMk7PoqDzvEv6
 ZQKqUkbF0uy5ZgCCJ6Mmh0eomyqQbWWA7dDkOWv/UXkkDFv+/OBd+X3Ehwjt6Ipc7ZfmPLEwdzV
 chjWlu/o0x96QJjPN92bRg0dzQwcRSY4lIUnusFmXMKxmODSQOlDr+fH6Q2GYKVphXFnc6nDZLa
 pWwXPC25En0JWyGVajYF47mkzRkaoN3ST6+daIzdh20CIazsy3bNHOaT+vwgzNfYwvBbxAp0e7m
 lZNsuRw9aJXPXZWl3znSi7vJs5Qhkv+iSUNSSRrI7h6WNch3OK5uTGqbFguYh219VdiCk4muweN
 3DgUu8uiu3jUCi6b17g==
X-Authority-Analysis: v=2.4 cv=a6SlZkSF c=1 sm=1 tr=0 ts=6ab4f361 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=5bXfVmoitGlP2aKi_t0A:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 4HfyBRnQsdJ_Kb5qpUfOzNSqRa0xd6Oq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240041

On Thu, Sep 24, 2026 at 04:48:05PM +0800, Shawn Guo wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> Add the Adreno GPU SMMMUs (MMU-500) for both GPU instances.
> 
> Wire up the gpucc clock and power domain on both adreno SMMU nodes in
> nord-embedded.dtsi for embedded Nord variants where gpucc is available.

Oops! The nord-embedded.dtsi changes got lost. Will fix in v3.

Shawn

> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
