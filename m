Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610121;
	b=LkJXBw1C96VaVBqg7iom8FS1UYGNRL8xrXd9ctUbiKOxrOMIh11hrk3+tpzc73e8ZIIf
	 fd18ApoBlYCaeYjalKNoN6bZwxT+n8tX59GU+L+UeQaIupH20qL+/ts/hsqoyNs44y9UQ
	 D8fiNSggJ5lq79HOr0lO7quTU3ANrSW9EenFU68ZkVDjP1iXoeWCFL2Kq2JyhoHbjcAbc
	 bh595QfzAeneXkzMAdK0I+dg7Hk/lYMXV3rTadi33FZ9Z1SsXgSMrpk0lUW4AKFuF8yWo
	 EBVpmoswLTT2V7dtGw7szYJBx1CDgJChOQ5MwC+qKjEeytBOTicDDPJnFp9suDQMjgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610121;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7gCWm5f0fW+q26OPY8/fXasB7P14OVIPDrLLral8tUw=;
	b=Z5dVkOfyzVHxhIjuR7KqGCNkZjCBvR49OuaVluZY5kPo32KWzxys7Y76/8sXPgrjGibv
	 ZswbgPFdJGF1jjUbbfO/VSs9eV7xxt5J3a+SGGw9KlnppeGfnE2uK4xzoYRPjyf7QiZne
	 TaHFngPss3sbHM0SxcFUqbmjIjJPdzbTQDILQdI66WbUjZxrzVIAWa3MzDekLvlltl2yQ
	 bY6BkiOlCT4GrbdIpruF/dj8+JGkQNTHGAeNDCevl63lNv1hGgljbsSQxnaqK77NDROqK
	 Bks6TAtJtbicaxob309/XeQ7v1KPhab01lAB3U4FSw4mhz+LxKkOPV2lb2JAGH0SgzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dy48WX7r;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="BBC9h/Cq";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2790606A323
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:35:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2790606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dy48WX7r;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BBC9h/Cq
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mLbG4131181
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:35:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7gCWm5f0fW+
	q26OPY8/fXasB7P14OVIPDrLLral8tUw=; b=Dy48WX7rv3vTqORDur6yYnutQxA
	Y26RUD7aZsx2TqWGe7DHrzftE7gpmM5fDLnaWRlNcSDAJ8x2dgOdtOPL14HEiv0n
	sQxIGa3FZnvqD3qifZW+OG8QwB7NX1DIvgUHKxeGuw6MGNu9CdJ5h1Ejz+/vyTe8
	zDMT7TT6ufSyLPPyIZsgL3muvmskAl1Bdsq9n2LTRIcDOtCczSKkRvlAoDn33x01
	yBleK08wnT/AFWNQ7Nq3kLTKkeWmxvfwbMb9qQPe/fLulV+xc/PPr70h3h8tC4KH
	ji3RGFbwlEvozhohO+uPpber7PC99KTJPo8CM/RScgJy5mh1Yn8cm8N15FQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhruk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:35:19 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so3644591c88.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 04:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795610119; x=1796214919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7gCWm5f0fW+q26OPY8/fXasB7P14OVIPDrLLral8tUw=;
        b=BBC9h/Cq7h7B/PE7l/MXSTe7eYD69cqrN8BlkwiUXtKcFBeN6FU3XhwHprZ1BcRNuI
         AKvbIYslQ+FYAWaqCdBunddQLVHFd71LFNDX/e5L+g5i7nZ3WjgFPSopbGVvdghIHBQB
         yHT19MYfpXSpKTGTyOtEtUXlYaBk6nXbxh+rj9OQMIXL15c/VkTbUxR0pbfyQXVqvCVT
         iPKo+8agSfPKgf45XSbPaJkgB5jNBLSbxdU/F4PpZA7ufoS3aAg3kf+Zs/vuYMcKjHp3
         xXE5R+pHxU1nWrK6x//pqvIE18JMuD05ZBCpqmLeez6iUrslSmKntpC027lfy5D+DDk0
         kAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795610119; x=1796214919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7gCWm5f0fW+q26OPY8/fXasB7P14OVIPDrLLral8tUw=;
        b=lrQIalrezPwgqzQ+YhNOcP/qK6AQ7Zd/jlKtAOp8xE3USmEKo/yyPz2CO3Nm7ScpsS
         xNIeFnZY7lBOlmqhQXkRyQBw3vBwDqJscDK1lU9kL4611YThe062HNCk8w8dlYMNjcVE
         qzO7roy2lMCkM6JdrieBgRNdUDhTaGGAIPut4yHEytanffnPtMFS3a6MKZ+pNHy+31G5
         LejctF95bykNeVwF1YzYErN0Ja1MhVDaMsFvekU2NykC7qLYaetjhT7xYbZdd25H1e7y
         LvX1nbQVcFRQ60j9INKAb9AAkf/gp32i5YrAG3sA9RAfk2HYzhVGr64uJUPIM4J2b/Cg
         YibA==
X-Forwarded-Encrypted: i=1; AL+hErEDhVB/6WxEULGnOfsfH6UJAdA4RZj+8gvw2Fg7iV8ualGjYpyfzTUFm3jg/cBsTpGos7Pc9guBaavi@vger.kernel.org
X-Gm-Message-State: APuU4Z9lU83g87zki+C7AsZKoo1E+p8hjK78Cj6kUL8Auh7VUdIUgKOl
	EcVxGhUcPSlvlgqJCr9r5RZPZDiBjFRzbGjiXFPaAdtvbkEabERfxP+CfvqA0SvENtGxyiQ9BE6
	bXnsEbzn+Xds2Ez9L948ewat228V7sD1EbYwsdZ5kfRcJhf5woDu3kpoQdBywpkvD
X-Gm-Gg: AZFdTZezgR6i4ey4qXVbBcylVYCCRZpjTpwVKphEvdK7wbxHVF+ZOC47lonK5a8FXjP
	t11G7mkOHRrTlq91oll28ABhktD853dQrVj6CmWw3p8rBak+vYoONsS79f8W3e6BlYxulKwNuT5
	szmcLSUZAckHtPQVG8q1vmoJHENLrrCbOPp62YWfk0CzR757HaRoKi4y1Lu+yyEkaXb6CqhZmJZ
	1splG/qiqMRJMcPMcSdbF0VKuaKKL4wv058RWwtRAZSTiBZPjyArHfvhcZI1zHMEf3U1+Vi5bwQ
	oBDdxxMVvrPk0OLDT9BDWs45rsTaljyCwuKf5btv/BuYdS3gh+ZrRdLiZzMM/kFFuwTiWk/hoBh
	373Z+tSSQXHG41yiUIBaFT5aminHtxtCcrCH6vWcpNMhEeT+vwcrjcCFkyOJROXsVObBdYHOTyb
	VQcNcUJmRaG1Md1LWmQpYCUrvwdIhhUgsdUEfn0Z4aRpeMQ7uWxKZj8BM=
X-Received: by 2002:a05:701b:2508:b0:1b2:3497:5998 with SMTP id a92af1059eb24-1b5568f03abmr16213746c88.36.1795610118729;
        Wed, 25 Nov 2026 04:35:18 -0800 (PST)
X-Received: by 2002:a05:701b:2508:b0:1b2:3497:5998 with SMTP id a92af1059eb24-1b5568f03abmr16213718c88.36.1795610118165;
        Wed, 25 Nov 2026 04:35:18 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm66856523eec.5.2026.11.25.04.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:35:17 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: spi: Add compatible for Qualcomm Seca SoC
Date: Wed, 25 Nov 2026 18:05:11 +0530
Message-ID: <20261125123511.401747-1-yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <04e8a33a-ad20-4f2d-845e-1c0b13984a69@sirena.org.uk>
References: <358f1284a656582ef0ea0e2b7bc07224372f9fdf.1795517702.git.yadu.mg@oss.qualcomm.com> <04e8a33a-ad20-4f2d-845e-1c0b13984a69@sirena.org.uk>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b06d607 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=38CvgGhHUT3NM48cmdEA:9
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: 0uRu-AB9WcqfQkbPAqmCmY1Ql1oZFbCe
X-Proofpoint-ORIG-GUID: 0uRu-AB9WcqfQkbPAqmCmY1Ql1oZFbCe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0OSBTYWx0ZWRfX7QbkD4F6BYq3
 sAFsKV/erdqGRs0vH5lwikah9PYDZ2fuf1ySvdmtwUJmaoBqgyEa+3CJa92e539SELwicP4t38A
 tiFbVyKYEB9fp0+IXnuvOHM/KYXiPw8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0OSBTYWx0ZWRfX+pCzdaqWChM6
 SqKJMfKq+u0AtvAKk4wC7yelqF0DML7gBz2h7UBNbhX/Tk7UIzv96/wgBOYLE9eLBTVb3bxUQ4S
 PFnYIMhHjOCps8dccBtxNY2hBzwHjrQAW8nyS/z7OpTta5BHRoh2weztTS4/TSxaJbvG6bnVyfX
 XeTFkr9746qmsN9VBQOBiW3JNDkPudjJ8YkSBvLEB9Jy+paFthUWLcnVV1OoJZCyCohreB+aszz
 R/os4FAbO2QsJwhRJFifj4grAC7N+GdMeOzqbPUsMBN/Ts3b2QGnMrDVg1S+KuJPC/EQ1LJswVm
 +OU/d8ySpMR1ecEB4Uz7KgWxWrKq7NikX6IHR71ibc1glaljkMM2t0MuyAtJHBSHMEvNmnP82sd
 NpwD+OH2HkkdL4HCXgX1SuSRC1Ab1J5hlfo1bScS15ESW7NyyfRN1TVoCAhqp8s6o737ivPLBvS
 oJml/UGnELVnOpwWFNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250049

On Tue, Nov 24, 2026 at 11:35:53AM +0000, Mark Brown wrote:
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.

Noted. v2 will use "spi: dt-bindings: qcom,sa8255p-geni-spi: ..." to
match the existing commits for this binding.

Yadu
