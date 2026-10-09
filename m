Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080B93385A5
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 01:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791510647; cv=none; b=HTRiHjeH0fMs6b8/JiCRWUbj2R0r4qztd6Iwy+7rRqhckaebWrk6q+hv1s75pzD4G56pNMv+C+9Y7i4jopBjwVur8xId0ntxPSTL2h6LzK17/b+eOb7h/eJaZ0m/M0qOZ05YMISOgo2SB3MkCXzFyJGowy/ABMEDhzF4I3Lr70Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791510647; c=relaxed/simple;
	bh=bzyXo88bbpqY6OVmCc6w30E/dMqXq6juRHJb1N+nFEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qdCrPkPcXXelZgoWp7ASweyA+d5lt/Lb8d7C01R8taLdcEsJHt2QzagSxJjVmCyXtN/mSUNGVsyyBMX3xe5pNNRL/7qYt1WCcgCpMpSQWFiY1LGREYS/edMn43FLbuUlMh/FtfZiiBZpgiYkZTnQNqJ6UNdKTc6qNGqy9KvkcrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mDikJI8G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gh8Ei2Nd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mDikJI8G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gh8Ei2Nd"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6990Pxha4080190
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 01:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Zgph80WKQsUMtMvcVbFtnTyy
	4Q4vF5zHhNaoDpXMoq4=; b=mDikJI8GxcLLKgxXBKKWu8cDydPp3g9muiOhAy7n
	6j2g/HzdKW9MpFjmAm4N6RtwhaVpSxwV+u4ixXxdmEr8wS/HjcyFiplMGY57oImm
	1Df2Y5nvIsUSMXKTw0IQpnlC8KQiUppSxx9/HBmhHj3aqlPB3Yr7liNa5C6Q2qQk
	MHSm295wVijXkXbXpWtZYkhpK+HVgogAj5Eh5RKr4Lvy6ZL1Xe4ZcabsddIK13V8
	VokyfqkNkZip2gCpTbv9+Jzie7OuyxCEYKR3evXc8JuBNqY5Wfa398yjAE2ZfS4M
	Sx5NGA5jOiErD+AQfIV6OZwsD6qYyweSoHk+sKYznLLAdw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fmqsg2k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 01:50:44 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34d62bb27a1so2318679eec.0
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 18:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791510644; x=1792115444; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zgph80WKQsUMtMvcVbFtnTyy4Q4vF5zHhNaoDpXMoq4=;
        b=Gh8Ei2NdkHbL75p12EPxrTxD+4Yea+bX8I99kSvkW/3FEq1u+bOcMWqMt1fBlwzxp4
         93+jcvR86MHGsPgXyyghPnToTc19fXVYkpKai5aYgnbz3Z6pIJqA32f3q5yfD8W1YWOv
         2ixJipETLP6DOhk3zqatlan++K1N5QnT2lzWaJOyoymnNNKyAYYSclhB3Q69H1WD3XNU
         gxckb/uOkJs9MVRlS+aNzAcXpvpcGQ+f5NPaZ42yHRjTICTT5GIX34TSO4+jZll4acL4
         3pxfT7/G/EHLJY9L/T6GilkbRpteseektledOCyh4eRDN3T6vJxUDAT15zmc1IFqyKyH
         opeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791510644; x=1792115444;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zgph80WKQsUMtMvcVbFtnTyy4Q4vF5zHhNaoDpXMoq4=;
        b=n4Tz0aOhSUIlOMl0UQachZb4suRCWxn4kQzwNVuKLv2u2Y/2wPN9ohGM+nTIf+RNtQ
         gU4m2x2MS8nXTQYFWl6MFOyZFFI96ZrdtWRdAO7hc/i2hn50nin+cYaVlKTy8ljP7mfs
         DqahOAgO7IQ/mX1UPPx0JTmOYlwmHg9TDHF1e8B055DWDSOWibvayItmz5I5uMFXQsQb
         VGeGPdC9x+uCdsVb+1t6g/NasamqmWQErBvSLEPbGJAdc5+HkuXd1YPxrcit2mTp4lNT
         PcddNO3zYfxX0yII66Dall6nv/G+d+c+kBGjChKkzr+YTr46ljkqTjWNmCpZTA/HZK2R
         T8VQ==
X-Forwarded-Encrypted: i=1; AKwUvBx++Y646fgSNBpD/G017Uy8+EHpHJE9frNszNsZooi3RNRqHLA4KCOX6ov7GocVQLqVbbuivnol9/qX@vger.kernel.org
X-Gm-Message-State: AFq9FYKwTY8E36HC9SH39R46OxHt6GqoFKAVFXa9XEfBoAbx1k6Uc/uu
	fPwlBgIkhycy1ezNa6AC5yc4UMzKSBrmRhxM5vX1DG1aFU0nQk3fw9Ngj9sSYKScMw8yP3eoI4J
	v6+k2t1cnfbeEKobwFl36IT7/FSspbuV36GANe25AAgFd8gRqAlt8N/KMPoDhphZe
X-Gm-Gg: AYBFou0slN09Pe7G5a/wbLebp2pNkG47bfJNwOc3jm+ctSznhI9/rQfzfEe9U4K5CKC
	ig/UlJnAd5l8LvQJzNc3rCq2m5VBIRVfOyEJ2qTZsE5Cn7v2VZ8dKsZ/IJhcqe4AnwIWdmsZi7Q
	bLXE8pmU3WPGxQA4W8gZwieTTIAgvEiRx9dYH1UP9s0vfE9QvmYJKTsm5dD6ejmoKL9LVg44M30
	JKCBxYiUuFzdWUXtnffjpQvLHB1FN+rJ5qANIlSs4nGuCOQrb6Bz/ZQooM6f6UqHWuItTz/UHys
	JSFR13jMI2TRMB58Xlpqnj7Ik/ibx7izUBV8R6s1pfgmdQI25lgl9MKufdpVUNDnaS7/9j3619t
	+oWw1rgbu7bXNxB4rQfapOA/jNFRkYkh+mFR6QMvNZg==
X-Received: by 2002:a05:7300:81:b0:353:81a3:9032 with SMTP id 5a478bee46e88-35381a391eamr216570eec.39.1791510643702;
        Thu, 08 Oct 2026 18:50:43 -0700 (PDT)
X-Received: by 2002:a05:7300:81:b0:353:81a3:9032 with SMTP id 5a478bee46e88-35381a391eamr216532eec.39.1791510643172;
        Thu, 08 Oct 2026 18:50:43 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb2954bsm1964083eec.26.2026.10.08.18.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 18:50:42 -0700 (PDT)
Date: Fri, 9 Oct 2026 09:50:36 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 0/5] ASoC: qcom: Add Nord audio support
Message-ID: <ashIbH52KeAcHeML@QCOM-aGQu4IUr3Y>
References: <20261008-nord-asoc-driver-support-v2-v2-0-0b6f7e94060d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-nord-asoc-driver-support-v2-v2-0-0b6f7e94060d@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAwNyBTYWx0ZWRfX6786QhkqvAY7
 mqIsFXZIO7aqMHb71GqNV8Jsioa0nRgFFv/WxOUSJJCVeyD5He7aCRPwvFOw0G/QLz+xgXvnyIM
 zwXihxNeBwI3B/6f44RUOtXKCljNFsQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAwNyBTYWx0ZWRfX3Da4JZdDsmND
 Q64aBvbDdtMkCEalq4FD2m33Nd+Hsv2yeSZjsvHTaHCS4vpSCet0lfFMlalQCLwFrwT9955Jqxw
 Lk++YTyPoIXaBzOzgbQUUw12RID3nr2QyBS3bRvILkEYnRmb6/W8ZTgHzgEuFwmATNi1uLD3/W7
 Z75z+hkEIACA6bXj5npaivJahX2reL5/Cf4j9xC8ZRr/WXf6Izs/FpulK2AGVxSwewlLrsrLt+a
 s0BrZ8NNhmjqpYW5/7cl0MMXxY5BC+S3EzSIECc9gdgUPvThStj53NhukgFUklTNxno0XMxD+Fs
 OKHmQiHzd2LfuY4SmB3n0jwdRL5F6pVouyTyiwyAotYolojkrpE2ORKD0U1Ly8IHygOfmidWfR6
 ikEw1qyGQ3z/O9fpU1MEKN58SHzpBd+8uwJICXrqy1g0JEvJ7MzOJWlBtIyPQMWI4l/JHDlWBRx
 BkKuCB/EOoC2oCNg/1A==
X-Proofpoint-GUID: M_cpKx9s8PjddeofrF1a5DHMPyF8ec4f
X-Proofpoint-ORIG-GUID: M_cpKx9s8PjddeofrF1a5DHMPyF8ec4f
X-Authority-Analysis: v=2.4 cv=IqCL47/g c=1 sm=1 tr=0 ts=6ac84874 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=PeLITbGe0R9p4Ny4VdEA:9
 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_01,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090007

On Thu, Oct 08, 2026 at 04:36:40PM +0530, Mohammad Rafi Shaik wrote:
> This series adds audio support for the Qualcomm Nord Ride and
> RRD boards and includes the required machine driver, device tree
> binding updates, and codec improvements needed for the board's
> external audio codec configuration.
> 
> Nord Ride uses a PCM1681 DAC for playback and an ADAU1979 ADC for capture.
> Compared to other SC8280XP based platforms, Nord Ride requires
> board-specific DAI format and codec clock configuration to support
> the external PCM1681 DAC and ADAU1979 ADC.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
> Changes in v2:
> - Dropped patch 1 from v1, as the ADAU1979 codec change has already been applied.
> - Moved the compatible string from the board-specific file to the SoC file, as suggested by Shawn.
> - Added runtime PM support to the PCM1681 codec to manage the SCK clock sequence.
> - Added TDM support to the PCM1681 codec.
> - Added the required POR delay to the PCM1681 codec, as suggested by Mark Brown.
> - Replaced LPASS DAI IDs with QAIF DAI IDs.
> - Link to v1: https://patch.msgid.link/20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com

I expect some PCM1681 driver changes in v2 to address Konrad's
comment [1]. Or do I miss something?

Shawn

[1] https://lore.kernel.org/all/d2d2feff-4823-43dc-9014-099e69195280@oss.qualcomm.com/
