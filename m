Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BC041A4ED
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 13:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785159624; cv=none; b=L8d7gpYFKZ8narIHMCxTffgitvR/5MPWgAez0yXvpzutUFH3LTZfI4EImm40QDXYdWXGuNXCLVnRF5HOzTIv0VG7liOYdYrj/VbeLddi0EGs5as+Bp7MjfwQinvzvIAF2mIdXebzVzoKsSYDHzmB660GadxwV+Y0UqGDgeJSqTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785159624; c=relaxed/simple;
	bh=mudsDM5S2/Wn+m9p8y/1XetPBmVIkWM/W0ghFUO/z/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QQGWDd94/qinM8ShkYh0WwM556Bhn+YzuqgMTo8mUN2c8YYwEtZgG3eezTDvfMDMDa1GZy8JE39eNFhmLlBMXw8agBWAPVDavV1AdVBiBX0XM7hmybPQO+UI1o3qJTWDUJD0jBj/4NUbBONShqI2OOfgcg6iRooQI7q81lzC4+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hepkz9+k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DbD45dbU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hepkz9+k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DbD45dbU"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RAMBuS3427651
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 13:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v2+1T7R0YtCVXdn1X+w7C2vkX4E8Luh44OahxcNxFTc=; b=Hepkz9+kvfmj44O/
	j9S8OwWmleKF7IR8T4Kxs6wGMt0jT9oIu2G0ywIz2NlJPJbZvCfKBbV0hpKMp68N
	hS3Rifgv/oJ20pya8EJU7/Dtf2ki8ZDbx3uyI4vafCzI2tvwMxczL7b9fzQ7rbCP
	Wr1kWjYlf83b2FoJrInRO/Ipqel08+SyvGA5eCS6RbujVzxgM87+p1A8pXpnVtXf
	UGx5KE8m31vAL1Ttr07LNQa3VviL11/TiQmtIbBvkBQ6UrWcGt051QMoQdl6+pGn
	M7QrLxopSbmmwuVOWCtr8ZCqX7VCM15l1+Gdk76bxrB6+d0jC0GZRc8yzlbIpLfX
	VPZl/w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fnsxs2tk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 13:40:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c9d953b71so3632291cf.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 06:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785159620; x=1785764420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v2+1T7R0YtCVXdn1X+w7C2vkX4E8Luh44OahxcNxFTc=;
        b=DbD45dbUgZXIB5TlcNpgDYrh9zgS1ep6fgvZpGk08x/1cLNGdMy/IzqEiahVfuRPPT
         b4V3y0jeM81GRfAUmqtBcgF9sY50DXrymYjvjEtJ6tfYSQfOmtVUl9Yaq3igQIvSPDXb
         88GMC/Wc6Aw7/I1m0LSmO6zXlADn44wScG2D8lpWQLH0EGhtiAeLE3P7svhu5Hwi/1Ct
         k0STNF9p1KhbUPF1fJUfliqB+kEDKn8DhNfG7gnP1KyoMbky4g1YWIQiqGrAHnriA1vV
         mriDnyMKyhdw5e2OFGgQGQ8TJmClZVO8WagsHK/DjeJg8XDYhhqdlg+yJIjy3fLLOwL7
         DhpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785159620; x=1785764420;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2+1T7R0YtCVXdn1X+w7C2vkX4E8Luh44OahxcNxFTc=;
        b=oj/XcRqWNOrDFrP1dqn/bNVdKKf59kJqg3lLootYLqwJAvXIeQOrhFl3Bh4NbUuP1d
         sQqDHB4RutnthMdjltRrX2/9uA/kEVtqkqlEAWvkA8tWgnhSzzLDugtGHkiTZZYGBe3m
         57ioas3tv2XyoiBr4mzxwa53blAE4/2w56FeZME/RC8k1hu4pW64GXKf2tkwzb4BzxNC
         wziDD+Z5q8AsPtI2x2zOeqm58btE0PH9tqwSJ/WO0PSJqtLJlZos2nfJa6rCpoeRW/hK
         FLGPKKM2uE7DbOIG31SXLFE53KI+jkaRt8xzqn9bLmylkO6tiGataBCqcYzRRUkxVDVs
         /vng==
X-Forwarded-Encrypted: i=1; AHgh+RpQcQ3pFtwBQ41vCDh4YzE9uX4w75NHE95m7MjZUSIiBfHrrxIFFzkyUtzBFX9ZaHIwzAHJQ5vftfxz@vger.kernel.org
X-Gm-Message-State: AOJu0Yws/qJFJkMB/fNuVSEe4s0TEQ4na3SQHoBobkmS1IyuqERLRo9x
	nKU1Aj4PEffCRonN8pohJbTSsGPEcKbn29u5w5PtxvCKbclwP44kCHT4cOTBdt0NguPH7favdkF
	1dOH6wSmnL0hyQYTMsiWsB9QYSkQDxGA2DEzSoG/s78u56Y+841cdiU+1++9hRSue
X-Gm-Gg: AR+sD11O4U+WnqFb5pQrh5rk7UUNj01ayVIlyUxnlkstMHWVWyvKjif+oa/bdqWUrxh
	YLOEY/NszPx9kyK00ZCNjz106NECzSGnd+IwY15+rr+2ovYaYFrQE4TPRSlZzDIkwVkO1rztUjs
	Fk6q2ytEj3xeH9cZ1YYrMHsyE8gxvSDBrID/1eQ5kDWYiNsmJig2sJznfdLzyaTkLDOefzTzM4/
	2Zd2tIFuhBtmwP+SutTsl2CYej08Umcy5W6vx+InWMJkWSKJKaXF2zIMH0q1y0bKaNI6nlhZC0/
	1o5Qykbo8P2Iw61wFemWIYAjGS//YTMYY7AxVUQ6bqQ9V+531KCZh1tYYmLiIBH6xfwXcG1WAdM
	+gBGoW+cRlNsuvg9eih+EMbF+
X-Received: by 2002:ac8:5841:0:b0:51a:d45e:638d with SMTP id d75a77b69052e-529cfe62fe6mr1043941cf.8.1785159619899;
        Mon, 27 Jul 2026 06:40:19 -0700 (PDT)
X-Received: by 2002:ac8:5841:0:b0:51a:d45e:638d with SMTP id d75a77b69052e-529cfe62fe6mr1043621cf.8.1785159619448;
        Mon, 27 Jul 2026 06:40:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32c90297sm667157366b.29.2026.07.27.06.40.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 06:40:18 -0700 (PDT)
Message-ID: <2de21f00-7932-4611-b7d0-0608b8b72443@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 15:40:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] arm64: dts: qcom: Add Kalambo SoC
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260727-b4-kalambo-crd-v3-0-25280faceece@oss.qualcomm.com>
 <20260727-b4-kalambo-crd-v3-2-25280faceece@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260727-b4-kalambo-crd-v3-2-25280faceece@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzMCBTYWx0ZWRfXzuxNLiuHxEXd
 REOvUj/AbPFWcQxfup/OZOS5rnL4bSWUpm5IxP8US/r/QCa8IYShsRpjVMymWXijQN8kY1o4+BN
 83MUq9TpQBWflxYZdfA07yCb4E5XbGA1ZaSojPbbN02KxNhwNFCMomzBhOPtVYNCjRd7PA+wusr
 LutD66cvQX09Yr2pOaroMi129MzxyLnfPJuPYw7rW2aEOwlipQ/ROhAEcp4t3nVS925PqXtCdua
 304BeLs1+hRUIRLUPVWgfmUheXK/B3sKK3U6hSfA9u1LhksLc022nk8Pldo2pJ+40+cQnivcbfP
 a+nddVxs0/LUTebXPxZnxApbVE95z9dXsFYVn3Fnxi2ys7BPmMZuUtoRQguSEHt1+39Ga7D8Yy4
 V6Qu+8b61VMKx7nIxaX37iUc25AkufHfSR3+5ijaxX6+zNsYyvm6gJ1/R3WCYCRhyg+lT0NoEV/
 Q+vRBWd20qmoi/6LJgA==
X-Authority-Analysis: v=2.4 cv=EYr4hvmC c=1 sm=1 tr=0 ts=6a675fc4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=EpawiZA4NEOSy88HQ8IA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: MFImtzmCbH9HteEPujVS97kZya3Z6bnw
X-Proofpoint-GUID: MFImtzmCbH9HteEPujVS97kZya3Z6bnw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzMCBTYWx0ZWRfX9PID47rObvL0
 FM/fOFERRuPq7tTw8VEORj7vcoR9Eaz5qnlmdF8QFVJqAC8lb4Z/GEKnINfzuiLh+Ixio5HCivn
 PqwKX0UKMTKo4n6vgEMhmqn8Amc7KBA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270130

On 7/27/26 2:51 PM, Gopikrishna Garmidi wrote:
> Introduce support for the Qualcomm Kalambo SoC. It is derived from Mahua
> with CPU cluster 0 removed, leaving it with just cluster 1 (cpu6-cpu11).
> 
> The surviving cluster is re-added to the cpu-map as cluster0, since the
> kernel stops scanning at the first missing clusterN index. cpu6-cpu11
> are reassigned to SCMI performance domain 0, as domain 1 is no longer
> present.
> 
> Kalambo uses PDP1 whose tx shmem (lpri1) sits at offset 0x200 within
> imem, vs 0x180 on Glymur (PDP0). This pushes the tx region end to
> 0x380, requiring an imem size override. The rx shmem (lpri0) stays at
> offset 0x0. The PDP mailbox addresses are overridden to match the
> Kalambo SCP firmware.
> 
> Add labels to the cpus and cpu-map nodes in Glymur to allow derived
> SoCs to delete and redefine the cpu-map entirely.
> 
> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
