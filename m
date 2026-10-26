Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009432;
	b=HDAfjKYm6lnCfCWoNcfd+aRRrxz93ptasi/b0JC4TptLn2zMaIU7xjapoNEdBWPW2DBe
	 MZNqs5H12KunKv+1SR1OtYImo0jybsIsZ2eP2XMZjaZ+Pj4wHP3bUgxemiM+Ssh+LgXEs
	 /Jj/r/iwDMXWPf2uZ7tdBim69ljhYyBCaPPXSfcfoSqMD9JRfcIZMWSqgK0I7yhRSM7Vy
	 phYAhmb0jlxrXLK/l06mpqReLvSginjTsaN4MeUBdQHrFryPWAPwLjCgo5y5Ae14/cHoX
	 /k96/ZSLPaWji49gYqpEeG0lpUfPm3AWlvz9kgHaLYDARQxFDvtsxJuQEzyTHWARD3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009432;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jIgN5Cj/MtRAZOtU25eK8w/M3L4YpmVZszmhqmwxHZ4=;
	b=OWMXDePWv3Zp9uY6cD1VDjoEz5NLecDeQOR7fpUtwYxNR4Dj4IloYDTAPly/k4lybajm
	 LqS4aJgZV+oisu+K0itdQkLkaM7L2F+t9qJl9MO3wKZP6zmUfz511q4rQn+s+xmBYi8sx
	 nnW9DMkXMTg64ZtVfyZlaev0ooHcGgvo8KCW49cYmw9jTi/sEL8c/8zWpOhUessN3vu3l
	 xW0Zq+YxYPvUA9V1X1agLL1a7mwokA07H7JBEO8QY7yhqFe8PD6LWWYnkWpISEvXOJWWN
	 4CIteFzTjXKDt6qpN1aOzd5dutc/36LtJLfKyIUbmgzjgMJHCJTVnFHsg67ArNQ8tNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VCb+6FDP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="M/DMihYK";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37DF606A338
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A37DF606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VCb+6FDP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M/DMihYK
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4bAiC718251
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jIgN5Cj/MtRAZOtU25eK8w/M3L4YpmVZszmhqmwxHZ4=; b=VCb+6FDP3Y+nEgD5
	4/8+M2fv8ldjC/JW3P4ulme6+kJYEeKz3duC4BlEWuxilut/8XTzOTeEZRdrP/is
	eHupL6qruSxsrTX8ar00GHR3AAifgbw0YMdeoipKq1X8j2iVGMrw4pllRdkxbNbq
	p1urT2Eo0JkfB8wel2+L53r07+ZXLzOTPFYWgVDeZS8KNT31tkr2n54zttxlSqJX
	532KGSxfWWfkmWMOaPnAWxGhfnRbAUuiNdZbH9q9c8192NIpJeYqhhmfSm8rKM2w
	pLjXddHqUYxqzupxMJPzBB67ErUrDl+44zWJo8iyl5dmXfHv3sZFSbOgbAhHTKWW
	MRn7UQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgssxgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:10:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1440e081so36162585a.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 03:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793009430; x=1793614230; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jIgN5Cj/MtRAZOtU25eK8w/M3L4YpmVZszmhqmwxHZ4=;
        b=M/DMihYKjqJEC0D0R5rcurBNv1i5LMixNpfqQodsSj67tpYXEk3x07AVbktvgkj9fT
         8gAsduEerqSblHxrJqq9ZJqAPgDjqIMLmk2lkBUQYqJa9EWNnAdUoohL4Pxx3c+nLZgW
         VG1RpdC+ANnHYR2Mc6KnGEDNQRmnlea2ihDR74ALKEgtJL3yIakYuDGzcmSWMRebabIT
         OiNvXyEjqXtpbZm1mT12fG6w1roL1PQ+gHFMrIU9PRT4OJPNXnoTwK5JMaY2JN0NabCB
         a0iy94nFsrrrWtOpzut0cm1u7PhooKWcMM2Jee+ZZmjJxOuq04C5YuvbEcmGVT7rx50F
         hlzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009430; x=1793614230;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jIgN5Cj/MtRAZOtU25eK8w/M3L4YpmVZszmhqmwxHZ4=;
        b=za821gg1BQZtCfBbTSsb63110rqCVuU2RLTV3nMhIICAYXqT64hgTQnKgjwJ2hA49l
         5t38m6nApV8IX/z3FsrM2WIL+eOXUQLyChcGfbQsVoPapge8wf1TqT4H7fV8w98b0lFQ
         WPhx2g+tnk7iV1MslByaM5KfSdTSZXYwhopmHckFfLT4OQlx8xQT7oOMkQew6cKCPfDG
         4aJqcz9IrazYj1TF//KobLAk1BKShZzayMpIdqaUcGgnb9r2MtRlUNV6TLCEKxUDqnsq
         3WE4th5TZCceSSoVZlyggOIh+bwXMqKQq9jZ4gAJ1Zz1tdN507bOZfpOulcwSNOR1hnx
         dCcQ==
X-Forwarded-Encrypted: i=1; AKwUvBycSeIksS9vrOBN68Wg+uXwzntkf63VaIEwiGMA69Bnpn1fi8+x8sjW9AZ2zk4rNOuOjyMbLi1xlRfz@vger.kernel.org
X-Gm-Message-State: AFq9FYKOMOipb2XWlhoxdH2r64E02eNfz5vSPmE7CbFtymk2wTsHUj69
	/L1bZtlsg3/L9eyIOl5YsLJatErfO6NoZ/4y75w0qajer5jnu6gfT0I45ch67nb2A8oUI2bCbTv
	B2g/nw3St/249kxLCDNVrVeo7wLa3mIBR+J6oKUOEiktGjxWDro9/t0YgkGw42RCm
X-Gm-Gg: AYBFou2d8+Ekq/KX5Ud5cB3t3aIr4QzZRCw/yygHOYjeH/4paPmmdTRl/HyiWAQOZbR
	3oSBOpQ2p2pYezTRZTAlehoWj9viHPuVZT7LWJUNsYqmfDnNywbMHBrZ3x+C+t1bMDop+Y/xvK7
	AkJML9N4ioGX3nkqoTU33VApm3ZxCq++7eGskGJsp3xOQlzdDQuxtBr2TvK4zRgfTCMrHHdWh6O
	Mmuh7Ksc3+TftNIfiriLET3eQOz3X5c3JP6Gbf9teS+YTXr9GG29jaP/RPudwZ+blh7Bwrj6Tpg
	gLv5GkhSiv2NvMWG7Ac19ImGvUUuc2LHixq8/DivkXqtfdCDDgipNNOw7RdLIbnHfzKcKaUzk6d
	ZHwiVGljRLaokuDVPeVj9jw==
X-Received: by 2002:a05:620a:7302:20b0:93f:211f:7ba4 with SMTP id af79cd13be357-940ef945ddcmr914304985a.5.1793009429524;
        Mon, 26 Oct 2026 03:10:29 -0700 (PDT)
X-Received: by 2002:a05:620a:7302:20b0:93f:211f:7ba4 with SMTP id af79cd13be357-940ef945ddcmr914300485a.5.1793009428855;
        Mon, 26 Oct 2026 03:10:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66fa59sm293589166b.61.2026.10.26.03.10.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 03:10:28 -0700 (PDT)
Message-ID: <a0ef39c9-d6a7-4e4d-a87e-e2fe72afcb73@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:10:26 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: monaco: reserve firmware carve-outs
To: Tyler Baker <tyler.baker@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261024-monaco-fw-carveouts-v1-1-1cd68aedf46d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-monaco-fw-carveouts-v1-1-1cd68aedf46d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MCBTYWx0ZWRfXwYg6iP4JzMP9
 XNtjAxICxS5fTV7cTSTW60k/3BexYKwWr4TLyY5XNF63vC/hLMEk7S2QxJJYOlzZYIo+qwVi1xk
 pk3uUsu0yVnnN77ZDJ2ZVDMWZaZz/sg=
X-Proofpoint-GUID: O22HBMPS8H43mjPX2b-Fj8u-21vRPVgf
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adf2716 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MOOwgwI-Wrxjjh533TEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: O22HBMPS8H43mjPX2b-Fj8u-21vRPVgf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MCBTYWx0ZWRfX9bimKVToZQwg
 82NKNMVKx0eVWmEYnVkTEhebJfskWxVeJ56tlgfZ5RytAJzFMhsOKwgD6xZn+XH5RumAxZFSLra
 T/g+x57vB0219PIpZAoS5cQ/C4aoyAQme4meBD13YdHMyiOhjR6FIq6WmYFyjdspOGAtk43LEwr
 BNOwBKJznYtA9Y0Zxj8f6GbyyM7PHCsHJfh6+84B2JgmoBEgCSxOrD1UhNqqKqNqdW2oPYZqCYK
 xLS9x6rtQMSCVNM+pVhMmKH+pcbxRWUenbdD961Am5Qdar9OhipyrlQT8MDJsyOq7/YDT+vCAEL
 6Y/FUENBNDtyE8+ZCdPq0hDcWU5D2t/Nh/8fxNsjqrYrtVEK5Y59heBNi5GdJJ9VIdKT1KbW0js
 RY4VwfTIw/pxCI31XdABd2yGP27f+8c/L6OIB7vudcv49mHxJaQSy67Ggjr9fLNWPW8Xh6rxZZ5
 tkzOhEax7KTDB+oo2fA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260040

On 10/25/26 2:09 AM, Tyler Baker wrote:
> monaco.dtsi does not reserve the DDR carve-outs used by firmware at
> runtime.
> 
> The downstream UEFI hides these from the OS. U-Boot as the EFI firmware
> [0] builds its memory map from the SMEM DDR banks, which do not list
> them, so it hands them to Linux as RAM, and the first write to one of
> those pages takes an SError.
> 
> Reserve them as no-map, at the base and size the QCS8300 boot binaries
> use, as lemans.dtsi does.
> 
> Link: https://lore.kernel.org/r/20260928-monaco-ventuno-q-v2-0-0e046c8242be@oss.qualcomm.com [0]
> Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
> ---
> Tested on the Arduino VENTUNO Q with U-Boot as the EFI firmware and
> with the downstream UEFI, which already withholds these regions.
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
