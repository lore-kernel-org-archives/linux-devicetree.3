Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96453803D2
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 02:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785292624; cv=none; b=uLvbqP5QrEM1xEMuj2DrwKqOAN+Wx+2D9RWzZstaXcYZGQoQ9M09YLL3j+stvVFDCr1gtcEDl0kZE+NmwwaySmoqkhBi0DZWSO8V8RWlz8io+S0y9DP7bdrJo0y0QYRVBnqrofE8Sjv9cKIucnJwKQi+bONP181GoPX+uk9WubY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785292624; c=relaxed/simple;
	bh=S471m+tdpEr9wmUfnxiHe9ToeYW5aFGjn+EhvG5fI4o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R1lhD8OWHFPwc+XnWHvhvNCFw9aXqp1wyytg4LVbPQ2wToubZ6hRjzlSErLTxdNBUduccTXKIkzwabYOdvWLVmBfUxnRamD23u11nS8xXqHNrbwN74j79mkeLVZopAXeJlCuKDlAwjr8/FRpgvP3Op95J8kwwybQqke2BAn6ur0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FQOTOyFG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K/8y5DzM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FQOTOyFG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K/8y5DzM"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T1HoGI4025800
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 02:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N3pzCw8Lm6+
	R+Zm/K8e8vhASXvpOVrEIMZaSYBWoJt0=; b=FQOTOyFGpbsr5cCH5J12dKCfFKu
	ZmZHl7OjS46FcF5KTB1i5ohBon54ivp6sRtlJFjI8dQIGm23afKnuMTHGY5CSv+3
	KtudImKFM55Fu33DgODv4RaWXBh3d7FntiVFtGdIA8IX4typepIQgatjJX1RjArK
	L85zwoALkg29wSztifbwlUqlQiTAhCHGhcu7LCrMMjSEj9S2ZVXuM1AUDdNMbXqP
	qyVEhhWrbfcuE2KQDd4AXpvCw0pXJt3waciapg+vBzbjnTZaWnxxL/aAYzCDr2Cb
	i0esIY+1PFVooUpDF/l2WQEHnYuwZzKjuTBmVb9gX7DXpxGeZF7qUgKlQow==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq0q0htrk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 02:37:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3809cc5dcccso98796a91.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 19:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785292621; x=1785897421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N3pzCw8Lm6+R+Zm/K8e8vhASXvpOVrEIMZaSYBWoJt0=;
        b=K/8y5DzMU4KQ7HqRsTqQcJnRD2L8Z3MHdWL9EVZVU3jcD5oBUW7yEc13tAwyCru7/0
         pk4HC89iE6HqOFGyor9LwJRTUSxno004+W41uaFEyLvjwN2iQYiVY/RJeH6C5uGMiowr
         r7FM0FqTeeaOXdixIqNekCyZIEfITh12J9YqkmA2EXpSQvXhLLRh/1wbdh+xiSj5+Yfn
         z2ly/M9lEwjavOUEMacQEnoeu2lcAQpuzrS8U2GX82hioKn1qMxw7qX1FedYLyyZJI5p
         La984OWm5UazdAhKsR1euy+Do2Az1SBWeEkyK2xwtOQKol2/eDtDeVHBU1Mtm6tW3TDV
         IVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785292621; x=1785897421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N3pzCw8Lm6+R+Zm/K8e8vhASXvpOVrEIMZaSYBWoJt0=;
        b=kIvAr2+cLwejwrenPYbPJMma8dpHeDpY4KwlfHjEX23C8WbjLc3G2+rNhvv87fYrSi
         c+0+8klJW9TxwmQdYz0q8joISv30fOtgYcOWnCXiLBYUAhIGgfektxkhqFwSzuFaOwIj
         jxszQXykud19NYG/94dleZ1yfX/3Gv1HOOMSQo4/aDnjbae7RjOYvyoIjEQgTP8yNkAq
         jGiqIQbqvwDlVKsfIn3nAOwlcNpVUq0aQJV+zUInLDjBWBP/vWTEcKAmByTlecXgSe2c
         y9zBGs8OVH6zRkixvcQID0cyaFWVPOeoOZe5LXlBBqg7FBLZFkm4HPcnXUERvlFzW/hT
         5m9Q==
X-Forwarded-Encrypted: i=1; AHgh+RqyKIyWxtWVFT6wyJuJrCxfh+Xag0olFqUk1oKl+sax9YIz2vm65HmGRcQ7bOIP87dgaq4u5diyCgPA@vger.kernel.org
X-Gm-Message-State: AOJu0YwJDa/Koap9JtUrpEjdYW7EU+NkpjNRZs2Cy+Gf6noLYtMSoNHx
	0j8Rq//Za8XH+dYNj476nT3GOaCOz+Az1JCVRhNp1I1WkHwNbDZIlLhdemSDvN13+H0bgg6v2RP
	B0p9qGEVHQHMUIg6lvSMu892MTfstDOBxTP59J5e+C/RPmAXF00TXmImivj1sa7rP
X-Gm-Gg: AR+sD10K5K40jrP1pzZqnjY9hXhCupSj8GKW3p9fIQaa3CGtLNaKeY8mLBN/qjGiDMt
	KFOSWL4a5CFpoQKK1x8dgQVYhozigu8Uv/9VcBMnewUH+kPTUfw0jQUNSejlE7k7sraEIN2q3rx
	BpeAw3n4qGGhcU97L6X22QxzJNnckRD5oblG9bOwIIVr8kHXq0jGaE0jFn7CYGZGhqKu+ClLQID
	8fnfbCoe2xGBfvZZHfzeR65dNJgsHW+R2/KECD18K7LXR345sdIqAO8lmPuzVFd68Mf4lVqpT6o
	7o3QDhzYNrqPaaDGsY85scnkfQyIED1cxJCsBPAOL2j+xFqfWJ2mq6fh+wgQnvP2Uro5lRtsg3f
	WGwdftQr/u//cabXdkpVin1bL23gfOfHGjzHtQ0HYlmFGo/V/VWU=
X-Received: by 2002:a17:90b:1b0b:b0:38d:90c1:2400 with SMTP id 98e67ed59e1d1-38f7c963fcamr3864581a91.2.1785292621297;
        Tue, 28 Jul 2026 19:37:01 -0700 (PDT)
X-Received: by 2002:a17:90b:1b0b:b0:38d:90c1:2400 with SMTP id 98e67ed59e1d1-38f7c963fcamr3864559a91.2.1785292620889;
        Tue, 28 Jul 2026 19:37:00 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72745b1bsm3737813c88.14.2026.07.28.19.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:37:00 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: wei.deng@oss.qualcomm.com, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: Describe the PCIe M.2 Key E connector
Date: Wed, 29 Jul 2026 08:06:54 +0530
Message-Id: <20260729023654.3840494-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: c547f8c1-7a49-4cdf-b1d9-22f00c6035de@oss.qualcomm.com
References: c547f8c1-7a49-4cdf-b1d9-22f00c6035de@oss.qualcomm.com
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAxOSBTYWx0ZWRfX/KC49s5cj5CA
 jgFuuFas6GVqRuHBKFEMtj5LwS6pCdiH2Mi6NPX7wdDzz9WfXD6zrNVM9+XK25zTrpLkWQD+XwM
 980aiPd3kNNxuhFauxEVTWX0GE8EIWP9oYujmFZ1uZ1qrXqZU9Fq5tQp5fE+xLHwwajvQqsjif+
 luhMexBw8Kg34ZW/75lwv5q63lxXW0SXNxQJPgrBqk5N3zA0idBFynQvMH8jcLdOvlcwoSN4vr7
 wE9ldGnkywMNN6nfZW2bNnmVOfZNMsUpbFrmC+nMmCvlxLsXIcOPp0l/zrwjoepnLjjQcFRRGan
 9qQKZ/G5Yeayb6XnuWTeQFFUikNR8+ouUGqkLkLtP7iMFW9OLwQeH9fEXGQu6lb7Os2lQGmw3/+
 pgaIEm0mTwSZ1j/rE76j0CutbJNei+WV8x79U12JVctSra/GO66lBckF0hUOLfP90S2KFcXs+kb
 JkuYTsonOGf970c314w==
X-Proofpoint-ORIG-GUID: yH-bSj5oemaJAA5hvFQjYLUIfy4PJDH6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAxOSBTYWx0ZWRfX1e90U0w7Htaq
 Gz+EtYjt2BGUOhL3xqUF4Xe4jAoHovU8Dmdc0vTMdTm1bICUwWJDcgTeOw8lwesbuoaLymDthqw
 XFB1lbSFuII8hzDZdQ4DmQ2EdYFxuis=
X-Authority-Analysis: v=2.4 cv=VezH+lp9 c=1 sm=1 tr=0 ts=6a69674d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=moYCNcv2nuM3ObtSVBcA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: yH-bSj5oemaJAA5hvFQjYLUIfy4PJDH6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_01,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290019

Hi Konrad,

On Tue, 28 Jul 2026 10:11:30 +0200, Konrad Dybcio wrote:
> On 7/28/26 5:39 AM, Wei Deng wrote:
> > The concern I have with moving these to monaco.dtsi is that other
> > boards sharing the same DTSI (e.g. qcs8300-ride.dts) don't have an
> > M.2 connector. Adding port/endpoint nodes in the SoC DTSI would
> > create dangling endpoints on those boards.
> 
> Is that a problem?
> 
> Konrad

Fair point. I will move the port/endpoint anchors to monaco.dtsi in v2.
I will also split the series into 3 patches to keep the SoC-level
changes separate from the board-level connector description.

-- 
Best Regards,
Wei Deng
