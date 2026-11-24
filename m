Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795499888;
	b=uAsBeJRZo4f9nRR+5G9hrF2PKdAu04J4BaTxQZnCY4D+bY5NbhehtTRMqxPathG9trfn
	 HrcW/tYpAgSHCoB0YfXZx7tReJ7VJTe1M3xCuJ6BqE8ADsyrzJG8Gmsnhb5tz6Zf7Av6j
	 HYWZ6tURel/8QER7yW0VaH2nQphIRIDgLhpfERE0jKVtIaiT+1UDR9A4rr6zy40xurGT3
	 5uO//5iR34ywtty840SB10zJ5xgIVkS59UBCjiar+b9mjz+XvNZ1/GmtMwFrh6G5k5P3z
	 TtdOgKZyCPNWcoMAvPti9Mdp6VodBaLxmqBxY2Si6g1WtqT8a11Rj0uZDf/8rWEbmjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795499888;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dqYw6HYYmdvUZfrzHDq22JpmOgPy72kyurBTcVtqHgE=;
	b=4OGR6WbD7xavQ13M6VsNd/uR1Jzfzyrb6kVhcheWmpxvlsUIPX796sdYeo1A2kNDWrVo
	 JFJIjDwN+QVgD3uw3LjLQ93JLKHN2it44OKKKQbQoXD2U1qhZpOTF9uyai1E9lc1g/6xH
	 6nJETTg0S8Xry5W7neOWDrCpi/AFhLdzwqPV16zVqKOkXUJ7cvPTuDLCv48tU5UjCbiSE
	 t2+W4d3/nlgxcb5p0Nj8AD+uvUVR6glhWTkvCPzvMX7JNfDjEyDspScduU43yBUWakLc2
	 4+fTn9dtDneorWSeaarzrxbCrVDquL1OA97UzR8/8m9MCUqtThC+SR0aeuG+DqRDxVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D7480KVP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SGvIqzg3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7815A606A326
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 05:58:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7815A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D7480KVP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SGvIqzg3
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO5m22Y2848319
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 05:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dqYw6HYYmdvUZfrzHDq22Jpm
	OgPy72kyurBTcVtqHgE=; b=D7480KVPS5tuJwMx7EojDR4apivGB8bslLJZuJNG
	/lUoZ6Ol7OyPqyImaTjJne7hO7yGFjnefw3FrdhnsPXEpmcovEhPLkshUbLkc8XJ
	PUYO6fZtbIPQ2z71kuQ+dhBlll5kqblFda3HJDtAiamZjnzkXYLwKGcOgIXTN0if
	KgW4svsAOQsjU/udeok+pfpg5mpwYjRLN1aA3kMwvs5/YpqsDhWpW1umslw4xqKZ
	snIGTZ/FfEmMkjpgNxpztNYRh3xyxlVdkOgnGbRpNNdcCpjbBCsIrw39TEVENKJs
	f5KS595pczR+YI/fPrjwjJhVes4I9k8Dy4nETgF2eX7wkQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rh80xd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 05:58:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb7f9bb86so822182685a.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 21:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795499887; x=1796104687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dqYw6HYYmdvUZfrzHDq22JpmOgPy72kyurBTcVtqHgE=;
        b=SGvIqzg3GsxsIKe/mghihwkD0ymg5SDQaULL1OVnZE48BDZey5kc2Jml5Gex7sbbNa
         cI82gtu/4fKNRxUv7+3OnP61fpG3IX31zWMBXUINS+3eZfeAc9+EWf92vW6O2ZAAOLqZ
         3l3h9NxzD1m8o6YJtyYcoPB6RopQcL7YLRN2aj6z5P4EAqGdCV0JErMDhtTC91lGwrKz
         IpTyJBAvgheOxDXJ6rnu+1lzbtFHaKdHdhuJusZ47/1GZ+o8Wu9NX99IIW8T0IvbGuoG
         53QCxARibIxLgjyCL4C9Gj0TP7xBqx6puLYv2c3Gruko1AS1RpEvHKUqFiLbNQMARoP7
         8plA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795499887; x=1796104687;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dqYw6HYYmdvUZfrzHDq22JpmOgPy72kyurBTcVtqHgE=;
        b=uikQCvUWZM312d/o4h+ByRhmncl101XM4KOH2zTSm8FXQEEBz94XALoki9Q8pRwNSG
         iuxN9kyO1SKqKOsKSHe0Wh1r3RBahXgGfztWt26T/CWh4ttodC9ZdyUhiNp9l/KjmhIj
         R2KTsd+BbVGWqSoceC0Eai5XVlQ1OkeQvEKCpwyGYnG4SaeE4aZMiYDmiAcLDMW7aqza
         AF0rbA+c3x5EYku9eT59WrP5y05g+3eXKSYwDtRVhNfksMhRFxC9jtMDJvLyR8+iFsUW
         uzM20oKITQlpG8Vs4WOqgqGayPzeYkbEHKv9naF7jn0N6yLknJxL73/EJEFOBOWh4NdM
         jB+w==
X-Forwarded-Encrypted: i=1; AL+hErEGuMcJupEK2Kr+pqINrGKBmqZ2x7WI/iOpJ0aVKqzFvWnAI8LHb+zerP+zbM+aRv3BvYZbzQ6g6rMl@vger.kernel.org
X-Gm-Message-State: APuU4Z/BFh8DQFIMBcpnGXHHRzO2yGiS0/U6XGKsvWN+28N4rG4EWDYq
	d0XXaedwYM3NctVG2BiILe7mvFxGDRv2F5zVSLd076+McKpoNRbIFSNyBlTrrq7UBt0DfbyPwDc
	Wgv2x7BD3FlfLTV+C6EPjAobWjIeKwPF+KbC4O+NRFMqoEzjdp1Qp/qcLRCPS4UpY
X-Gm-Gg: AZFdTZeKC+4nMIBG/bJN9WNNZ5SZzNIhwznCBmrXMkfcpEv9h6BcORv95gwZyCfZ2vU
	Kz2++rrEAfCbuXET7jLyvgO7VblLTH1r5Ni/E5qe8H1DZixke+2k7vSnLxsv+V65M5oYowa29Po
	Xe+UCuaIrm+QsyIz6NSbVZbSWmwRo4vC0ekhoF0RAFnW/TlmoABTDHSaUhibRi/lt6JnbsxuogO
	I/ok6qepHVOMYLFsXqOnhs8JdzCmJu32fhhfMjgmxFnHQmOZj/QKQZZ0lVSKsyGTb/fR3vvyi5m
	by6E79dQ1MZNxGYGyYO7UOTus0hXdQqQYeRGEFAKgCFkz+CsCz6AG71l+/5lY/6w+KlRqGsl5kC
	Zew/gnOaYHA+2x1nupOJuB5rTpT5wRGqCSMsC45QC72mSAikyNdok4Wk5wM+iRRSE
X-Received: by 2002:a05:620a:4110:b0:939:b099:d52f with SMTP id af79cd13be357-949ba95dc6amr2330843885a.20.1795499886455;
        Mon, 23 Nov 2026 21:58:06 -0800 (PST)
X-Received: by 2002:a05:620a:4110:b0:939:b099:d52f with SMTP id af79cd13be357-949ba95dc6amr2330841185a.20.1795499885832;
        Mon, 23 Nov 2026 21:58:05 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm152892675e9.3.2026.11.23.21.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 21:58:04 -0800 (PST)
Date: Tue, 24 Nov 2026 07:58:02 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: sdm670-google: add sound card
Message-ID: <yi7wy6g2mi4xlys2afpi2kkxfbhwx6x3q7fcxdcgvkcjxmcvnf@6e2c323lcnbe>
References: <20261124015611.187024-1-mailingradian@gmail.com>
 <20261124015611.187024-6-mailingradian@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124015611.187024-6-mailingradian@gmail.com>
X-Authority-Analysis: v=2.4 cv=BKkmP1QG c=1 sm=1 tr=0 ts=6b05276f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=FmVNMtDM8ubZ8rrqGTYA:9 a=CjuIK1q_8ugA:10
 a=zgiPjhLxNE0A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyMiBTYWx0ZWRfX0DaawwSZ79ba
 nxwXFE87JpMgzShqv2ClVazkb5KgsDvMpaqQCgV9QcrT6CNxF1Wfimr+3ucjdIF9sd5/SXTivOm
 lCC2J2GDaxiepgHzQNaCL9jH5GetET8=
X-Proofpoint-GUID: XPlcUjTaU2ZK4CR6E97OAN9M5_yIa0dX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyMiBTYWx0ZWRfX7sjMBjuZ9O5E
 kwZ6SnhCwPSniMJnCO7b2Xsx5ffx0yvoWQxS7X8wWRCkUosVO8uSQ/eaRjVaJnG3VDjAtYl4wZe
 MWMm5YZ4G28YcnBW8aRZ+uD3LbBDVS2dtvsUOWqpV47tExhtW2XobXleSDJIfxI9EA1eXwc3OQY
 hPDjIjXT0A11GSYin+becgATl1jIvHcJ15/B9Jjd6owLgpuQKRniljlpqkd3JfJllNrvieH3LB4
 VbBj1hSJXqzyHKu9/4o/vJhChlPQjl3aP5/1Fa8Lzet7Ukhzj2BOykWHHUN0KtMxdGsS4fcTv3p
 wPV4Y+WNn0l40OkrQochnlYYCgK/Uak8FGdGXPDQGVJG1LaNrgiuc0gOWHZZL5E43fM06zmeWJO
 d7De6+TqZniKPiFEO4rzw1ElkUeIiX4mymBNK2y1uKZUIVnYprdsxaUjxxzdQ1hGd2gKadoqtrR
 3sFJwVcF2zUu8EUKEQw==
X-Proofpoint-ORIG-GUID: XPlcUjTaU2ZK4CR6E97OAN9M5_yIa0dX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240022

On 26-11-23 20:56:11, Richard Acayan wrote:
> The Pixel 3a has a sound card for built-in audio (RT5514 and CS35L36
> codecs) and for the headphone jack (WCD codec). Add the sound card,
> q6asm frontends, and WCD codec for headset audio.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
