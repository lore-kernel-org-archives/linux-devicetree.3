Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795563991;
	b=BgtYfQ2OvuSvW3Csj2UgeuHnjjs7ydM7Dqpd6vBOjx4Z3dedfLS5n2HDVsPH/SZbuqIx
	 PArh32dfAKH7lo6Vk+QKVfGBPJLXM2gTmhFddeh7/3upI/Aj1LUCfUdBGZGqGP03IlfYo
	 N1Rs/sv76tGhvdPXh5XPgW2YAz6GQr8ulZBYFDQ7E8fDM8EruaJ11XmPM6crfWTZddGRH
	 Mza6yW/m9cc1ocCqVB4nE358IAKoARBvHfzGyTbe8M2yAPfp6zzu2tMIKBOdPuTZT2iXV
	 yMwop3cZ1VvWyPk4ATJhZlUQIp+RwICCoGhsfjSqtP/hI1yGOqgQA+3klPpVz8HjIDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795563991;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=h9PLOclrJUCEyLmOGP/JKvrxQpzGt+LITgqfp1kq59I=;
	b=NudaZQBJP28Y8Ke1T0yDKapP+Zrj+4kz0lX++j/2/RwGdf0kZtaGm5rJKmRW4KXBPkTt
	 SPJgTf98wp/YcH0nzRBnikOlxcyQz8Z17GAQlznHioAVEnIRRiXnrqoPkIYtFmFm88qP6
	 z5/AQT5+Nc/l1zfyxmzOXKskJgsl1MPEg9YE5vEOv93FsC1Xmhc2b4s6gwaYMNBxmOB1T
	 0f/3p6CqAtf13O7ydcn0HrL5w0wmqvs/Exx4FgDPXTpNL1JUYdRtuybqrywoIhP2v+Cla
	 aKCpLf0d6Ki7pe/oD/pFu4vjnfkeMTWxIV0ri1InEXD53pPbyRbZajTJeSRDQYSBc1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CUa2qDGt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dMs8C6eq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1664606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 23:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1664606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CUa2qDGt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dMs8C6eq
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMacVc2139908
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 23:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h9PLOclrJUCEyLmOGP/JKvrxQpzGt+LITgqfp1kq59I=; b=CUa2qDGttwLbSHCe
	3/pC86Ngts4KXgnbkhsDq/KclOuhAVRzaTqbMXG/Vg+On3NjvZqF1nm5/iSTOcm+
	tpP1nId2DuTIHQU4UbYXU4F4YToDCFwCAiTfAxw4r3S8BWbq7x7gxJpMCzan36d/
	v3Nmwt9JgL01GAFGwrpi53seHnHUhefzuDFplx2m8PSUAhWWcjIswqyk1+Bsasti
	W/+b53ygej1z4kJetQ9I/1B77I7q2JnCJKo+uFqRtwzjR1HHlABiLkYkPAMS45J+
	8dRr/QwxDemzJRrsJpMpS6TOhglWR4ggdG2gHR95jFd5toa9OogBGhjQ/LZyG877
	N8z3HA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gns8u2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 23:46:29 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3854627c1c8so7297575eec.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 15:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795563989; x=1796168789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=h9PLOclrJUCEyLmOGP/JKvrxQpzGt+LITgqfp1kq59I=;
        b=dMs8C6eqRPCtEBWcVED492Bexr9FYlS+abGyMDHGZoVtgWNStmm/juYzjc+0h5DBEj
         GHr1ozSZinhyv/jn8z23lnp9z5ExnZ8yG1fmE2ZC5c4NQtZchsfqGw5oYyX8OLCLWMhu
         ghxhguOShbUXMsdtzChNhJ2HGNensBOVYcCv0fw7fZeEiULXcVZwSyrp+OhKx3NIS0rS
         pZnI841DTJK0ptnA7JCM+yKq/FoyWkVkMCCBPLsU9jwxy99GTUmZz1SGR4wT9zTcUj1Y
         5wa+V/BJrVH8AOAEp9vJn/I/fowKmiIc+LL+me9krhALTcyWX9ss6eV7GFIhLEIUKREE
         5Csw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795563989; x=1796168789;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h9PLOclrJUCEyLmOGP/JKvrxQpzGt+LITgqfp1kq59I=;
        b=v4jmp0QXGtwH5vQZiHsJyjwx1pxrSDZCSXJ7vuQN49aeh/NDpbEzpFOsfp6HRR5KJ8
         JBSBqFWbIAoJrt9AorlGdru4db5mTos9lltpUV0JEsKN0yQrYk74WB7tvLdZeSZw78AQ
         XC910U0YIuoeNUspSjKEcFbS4K9Bk4RGZNIIr17cKP+zhirIiZ9W18JPJG/EQ3y26YCh
         YQrP6/KOvnXT6fT3B7Gd76JReYeJQ1gJ/3OkKHgjf85igHeJ60JRIlFzwKWtT6Fx3MNX
         iHlza0dxX5yBsaCdgeYIyLdZSO3yFoqoSiD6IHiZ/2D0AKDIhBSXTjSA0jXXHiT4EMCT
         Th8Q==
X-Forwarded-Encrypted: i=1; AL+hErEWTMH5NwruZON3ehW2zwAC7w5xtJV+N+YCvrNbMVQgFlZ8Pql9YnuqgXWAxEFDYeYpLZOXYPJPehqM@vger.kernel.org
X-Gm-Message-State: APuU4Z/GnajmCmGjDnKO3hrQgBmu/Zn6IXVU+xUySu70q170F3bcAQxW
	NwAmIUFThsrkubz7grnlWI5VJyKOq+A+qJ2BWvilscrKW5j6ZJ7vFWDsgC9KLJVy02sAfZU1Gzr
	rcfN1wC5a8KRODd10lxs0eXQQy00AwUDUANo8PwjdXO4CRAPq6KclCP/YHC72QHd1
X-Gm-Gg: AZFdTZc3deEhsrFEFvU2tjFSsAf5tLIUxU+ckikllWGp7bf9F45jMmLwudK36eemTum
	GqwWXqT1JKE2y3AJ+gKxcVpgKtVavgpAsCE7UTbVMY1PiAo6rdoWn2h6wc2AV0Oku3pmWaaEcRQ
	3jj33KN5VehtddsjRzZCFXVZyH1TD+GZMqJJ5d/+m5VkOjFunwIEvHSch68/SdAmObXJSGG4FK3
	gDuBeMPAw6SfP3ogiPIA8bXWSYBnGKg1f0GFRTzlm7fEQKmrOvENkPnUyNVqPr+qsxnxSnBPS13
	gmYvoha6J1Zn9wWe6VNSJR4TwhjtaGsL71Hu6JBByvruh2Bt9/PBrEX/ORoHSfTNoJgv/DAGS0n
	a2M5JtjSMncIBttdTm2qtLN4ZAh6IBXjhrEAQIrgaa+ym6b91kLbEJCwI4/BclTc8ZqofadgeZP
	pjHNjZS4FHJ6ir17ArHuUIGwPGTuoI
X-Received: by 2002:a05:7300:e9d9:10b0:386:ce20:31c6 with SMTP id 5a478bee46e88-386ce20334emr1027389eec.29.1795563989171;
        Tue, 24 Nov 2026 15:46:29 -0800 (PST)
X-Received: by 2002:a05:7300:e9d9:10b0:386:ce20:31c6 with SMTP id 5a478bee46e88-386ce20334emr1027324eec.29.1795563988410;
        Tue, 24 Nov 2026 15:46:28 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm57314365eec.10.2026.11.24.15.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:46:28 -0800 (PST)
Date: Tue, 24 Nov 2026 15:46:23 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com,
        "Rob
 Herring (Arm)" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v17 09/34] dt-bindings: firmware: arm,scmi: Add support
 for telemetry protocol
Message-ID: <20261124154623.00000587@oss.qualcomm.com>
In-Reply-To: <20261124194841.1147072-10-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
	<20261124194841.1147072-10-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1UYuHw67HLL6MdwViDCqb81LpUDTm9bM
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b0621d5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Cq6dmUWW68VXehLBlYkA:9
 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA5MyBTYWx0ZWRfXxJlxUp1OPJ8F
 mfR6oLxaCnJF44e8Sp39u2yQ8yZwhk7qfQckyAD+mwRyK95Ee8uItHQHqGsbp6Td6cTikerTvLv
 2hfQ/quhxdBthLnyhJvbG+Bqq6EQxgo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA5MyBTYWx0ZWRfX4x+3Qjxw0VG2
 itjhhyLPx02EU0quyHWDS9MAk5xiqLOQ/yS0WuNaGdtgAozfKoDkjmED0R6LSU/8IV1O63epF/a
 mJt/HW8h1HZHSgkDtPkAbGwLTBZuO9DIWg9q9/LboFdltb+8ceeqoy4l+5JBhYCZY0ion2fqBaL
 M07872a8SlEzWVXlhHRBajFpaAygW+IV8rsWTKLT+OYTiB1HJqa2cmR/RRVb2RsF1UFgeJqaOvK
 7VP3MjqXg9h3dk08x6jJqQ779FLU7gxRj8gHpwRRBqXwGylFdLmGg3cPG8TqALPpffRqDb5+imS
 /pRdkK95kEFXEekI94/H0rfEkXOLF3zBQlulFer8HlaeWvcfo7foK+G5YN5q79tBEVlUUV7nR7j
 ZCjjkcpEHT86+dW3mmLZksaC+KpNyt8l36j7JDdqJx/pxZ1KF85tXGnzuPrm2UBiKyb6RvCXhKK
 U0ezvBudOYQdKeeK5rQ==
X-Proofpoint-ORIG-GUID: 1UYuHw67HLL6MdwViDCqb81LpUDTm9bM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240093

On Tue, 24 Nov 2026 19:48:15 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add new SCMI v4.0 Telemetry protocol bindings definitions.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
