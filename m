Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794954319;
	b=4b91rJY7iwLcitP4pGsutP1yloXj19xyFldNEksl164BSxFhDA0cW3nBjqx6Janst2fb
	 ZhdphtH6eCWNcmjdS01wCO+c/AuqD0BfHlm8mM1mXlmXQ+tnoBZmPUmwvuDYu/qkv/xfZ
	 GnhbTnGPX/tLk9wM/nCbhuNfTiJv2x+FCn9T3YwZJX4jHA1g1yynX003PNgQ8oDtKntfF
	 xUcC7FPsNQWZV+RtPV5T//092/jhx/K2UjhTqoLNbev9auO7nGSpZhgNbEvCmvI7ZilRL
	 tK394nZNrdkow9iMCNtwWWifuPilfNdSbj6DroOuMWDKitucZcscNRo7ITO2vTzwtjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954319;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3VeSk617D+v4O2b7XH5K6xESWUQk69Ood8RmJux2MOY=;
	b=nPgJ0lE7nOF9ka1iL6Fq6YHB9Fpk1I70h/UMqucBhfKkR29iQDyVbVlq3dv/X2XzwrqG
	 pGLK5KkB8oHktn0LHgMir1CDr0gri0Yfwpiy19XQEIWUS/Xu6S2+0uU1ojg+GpQ5oBlGE
	 l9Wl74Yi+igTXPDlU8iQC0UE3LhhxY1ukiRX/zlwBZC4LcMlgIH9r73Yz+cGzd+5fWZkB
	 uIqdTQipU4epba136+fllcHiGig53gVxqv9GJRwy3piNQKsnUiNsuXaG+cBuDvLM83Eh4
	 qBrFGLaJXAHg/oNpzyhIrL77ImWxcTz8LiJTEViOP54YeLH+dbIk1g2KQ96RvCVvk+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EYlSZSDX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BSHQCXYv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D809606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D809606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EYlSZSDX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BSHQCXYv
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHKf8NU1354942
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3VeSk617D+v4O2b7XH5K6xESWUQk69Ood8RmJux2MOY=; b=EYlSZSDXRmqrVoLt
	k/6Mv9GEXrCaVkLfZRE/AyzmzTsrHfaaa73bsqfIDRPTpBEGXPSj+UcLkPl5eO2t
	RuMEb/RjNGoL0GCBLLgmgSRH1mui0KY3nvAXU9nCyxZsDev9Rf0eJZhUwJfSy8k1
	LLZX121uR7DHfXcV4cinik9qNaf8gVJYuvWPWuybCvThfC+/+nw0uFg+UWquTSlu
	KonF1sy1yOh4ITORka+Vml8JS5U9w+45qwRtypsMlcsJrOaDCAEYNOLYMUBtGlsN
	NRRXBEyNWh8m9llvQWXg6qy+giUFUoH6CYnGuoBt9ZTJENvB93Gk626yNuCRv6jk
	S9E6Kg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0v1fgwve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:25:17 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-378722fd4a3so450106eec.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 14:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794954316; x=1795559116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3VeSk617D+v4O2b7XH5K6xESWUQk69Ood8RmJux2MOY=;
        b=BSHQCXYvdP4cUpyh8FkOQX1gEBGOPrBIN162x+RCVRkFUZKL8wvs8zTiHqM9i/t2G0
         ZV7LURdfwf2jmiMERjtPsfvts2CQttjghTxJUnN8wkZTgZ34muSPcTCj1o19ouV0mlxJ
         Anpzjopxzf4ll/YYOw8WMwz8cCFyhYGh/brtKDw3fBpDv0ComnwaPVlzwBlAeVx3coqo
         +hKHN77kvEJlPWnlSC3vZVcpposNMUdbZYJ3maV0q2ywhk2lVOr+LP5ZsHtPCflc9+w+
         hSGL3WIkLb0483Yeejn2Ag8bHqJwbp7R1tjv12BZaw++Pbl6ZMtITjR6eRET9quL6Tif
         M8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794954316; x=1795559116;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3VeSk617D+v4O2b7XH5K6xESWUQk69Ood8RmJux2MOY=;
        b=ERL52Pz49jP8GKAmpCAMKVAIF5qtrbK7bpj1mRDBMUEDMdSg9QjYljQ82WuosdXCLk
         cUkZPOXZaeNYR9MKdpZPw2ayVioHeA7xc9+pDbel8qAFrAi8R3hFpJYkC4xvBR0lEnmy
         uJhST8cHHb+0YCZfjfVLVRWCxiIGxGWPx8njeENH0Fczb7RRhN53rZpg9pt8Jshj+85a
         73qFl1d3+Sb5dQkkPEYzhrGXZkEGxeWnPk1XOEquitlHH9OGQ3lB+yoZUGJjJlXotcHU
         fl9TI54fpk1LODPAw1v4NQTxhLcGSaTTJbY5l2frrPsi/SlZ6yE8n6pWsfD4M6uh9iHM
         TZGQ==
X-Forwarded-Encrypted: i=1; AL+hErEq+qDyWkW0F/WfGcJuL2ztLwQ01jMYBiIJZo0FNzHusIKVs3uwAnw2M6AGvQ3qkQ5p11d3qFF3Ghkm@vger.kernel.org
X-Gm-Message-State: APuU4Z+ClB6VbkvqDOTsXIkt5hZs0uT6i9eHb8ZledOmIU0EygjDLico
	C0rinpRwkS9c6LOprbfVRo5AJjiEf20HyXNhhDZz919nUpXDuUmyLoGbcDWWXmSB7fmoMeXB7GZ
	JYrcFuEjw3eVQFzczteNTZkHq+c9DyBXZqEql1CifRKEDM5ggiIOWJnuyj1WYDeYr
X-Gm-Gg: AZFdTZe98IZmRUqJ92pOX/CuxNmWOgGMcdHGYyXmFl2bj1SLhWZxlrpEIC+yKh1GjIO
	HIjKsn7PvDt+4xnODoadwRCJJHc8+5I0TzCoQPOn54MD7FfQhLXbXNCJYDxvPj8SWa3MCXiqrAs
	jJTjmDSnsuwKw0l/MpTE2rLX6G28vk1CQYSSuazAgdgLhHrqwKxyZwG6WfKASjkoeahvckxmqyG
	tsaAKxR2lcs247b74w3LXtuzGjMetEi1nh3OFr+QzvSI7obc8TcSDtxGLuTqIamVDaMEfmlGXAb
	FqUg1d/ToT2ruO+T8nT/CD9AiNSlVkw0ywdMegctd0+rXakcepqipqVuBDjJFkyABlk71qBgWiU
	eR76f8wAnOsKlpjnL1JJ1LcOOAknjVdI0Wq+Voln4WqSQBFTkTXh6R2YGT4HZX4sorl/bBhov5w
	==
X-Received: by 2002:a05:693c:415c:10b0:36a:1008:5815 with SMTP id 5a478bee46e88-3827dd05a3emr857621eec.5.1794954316349;
        Tue, 17 Nov 2026 14:25:16 -0800 (PST)
X-Received: by 2002:a05:693c:415c:10b0:36a:1008:5815 with SMTP id 5a478bee46e88-3827dd05a3emr857578eec.5.1794954315791;
        Tue, 17 Nov 2026 14:25:15 -0800 (PST)
Received: from [192.168.1.12] ([106.222.233.152])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a79c96b2sm1041210eec.24.2026.11.17.14.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 14:25:15 -0800 (PST)
Message-ID: <dbf1487f-24ec-4f52-b8a6-0c63097d7b1e@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 03:55:07 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/msm/a6xx: Add Adreno 753 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Shivam Rawat <shivrawa@qti.qualcomm.com>
References: <20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com>
 <20261009-nord-gpu1-v1-1-a06a6c57bde7@oss.qualcomm.com>
 <0fe6b4f6-e510-4fcc-b1a8-785438fac3e4@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <0fe6b4f6-e510-4fcc-b1a8-785438fac3e4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _lCskn2QhXPO2_BwiqoSlGRqmiHp43zM
X-Proofpoint-GUID: _lCskn2QhXPO2_BwiqoSlGRqmiHp43zM
X-Authority-Analysis: v=2.4 cv=IbgSymqa c=1 sm=1 tr=0 ts=6afcd44d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Q9FbUFTPKQUszr4Og8UIjA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ud8-AEEbLN8OrmE_FLQA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA4OSBTYWx0ZWRfX3Wpc9rMrmyWr
 1vH/6eMY1i0QJeFUVge+MaA6yoRgtGoCCUblOcFNkBNM/1N7u7DcMd64NWx76sfYSi+KTDR483A
 o0OE9ngFxj3Pfo4xuWhQx6efosfW696SKCHGyI5r02S3sQv5UODSH2apv3dqdB9H0j4T6SAD21i
 kXfIIRM8vOA26CURVnt9EydNWD2Fn6up8wma1ZmkekUOc3ycKPalChOUWw0QUBR2YihGPQobsx7
 0Pe0ftZV+ofhKr7Rd+JCf/2GIFIocgxqPWDUs1ivE2iVT3L68FH8JlwzFxTvc5mWBJpwaBzFI8+
 MngEy3VO78MzCW2FpS3ClGpttmD2vaO/b8NLQS/+CxJtL+jV7XTb8n5VJubOctM/r9KwmhCDEd5
 wUI6GZhifEg80XplJZ9fJBLuNC+wECq5aZyk9eTCn73/W/7Tw020b4V/C9DXSVhtEEISFlMV/t0
 L4qdlRR5BIjKQL8mqXA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA4OSBTYWx0ZWRfXwPOk9N/wej/B
 c/BH8IuDUxU6HITz5KL2fd4iTqQq/ADvBVJ10JDHxOyWEVxke91XAdpUZMOi0M/uhVC2sWAuByS
 1G+R/qJmD+D7AAL2UmPclOIofEHx0H0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170089



On 10/12/2026 5:51 PM, Konrad Dybcio wrote:
> On 10/8/26 11:06 PM, Akhil P Oommen wrote:
>> From: Shivam Rawat <shivrawa@qti.qualcomm.com>
>>
>> Adreno 753 is the primary GPU in the Qualcomm Nord SoC and belongs to
>> the A7xx Gen3 family. It is derived from A750 and shares the same
>> IP-level configuration: protected registers, pwrup/IFPC register lists,
>> GBIF CX registers, gmu_cgc_mode, 3MB GMEM, bus BCMs and preemption
>> record size. The differences visible to the KMD are the chip id
>> (0x43051701), the GMU chip id (0x70d0000) and the gen71300 SQE and GMU
>> firmware.
>>
>> The Nord primary GPU is the same as A750 but has a different chip id,
>> so it needs its own catalog entry. Add a new catalog entry for this
>> GPU and an adreno_is_a753() helper. HW clock gating is not working at
>> the moment, so it is kept disabled for now.
> 
> Do we know the reason? It seems that no other platform has this issue

For some reason, this is causing random GPU hangs. It is still under debug.

-Akhil

> 
> Konrad

