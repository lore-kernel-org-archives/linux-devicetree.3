Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201933;
	b=MIJmKJ93GNg2hyTD8tooO0+B00VwZUkunKUwHCHycIKsmFryYVhV+hUgmsREYbdmaJOv
	 dEWceNFBDUuDVhqpht5VLuY/LXYIdZoQyP3/aO3P0wGVvxDvtkK3N5ldCd3FEOCyWi97x
	 HD6lqZgkNlwBB7oi9daG313aVE16vasptvdZ8rnmXLwhFQlvSDF8O/cwXpz6+RZ+praOq
	 5biSZKl1pAD+fUYe8FvlOtoHfQGDCKv1tCoqfNbRyl5aG15e4W3o/1/NfFotovGifmBXO
	 +Geb21xYazNua6uwP+azflebBY1rjNB89eX8TbrvpE75DYlpOlvMq3XayrXKHBgShAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201933;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HL3n5xlRKDyRhGpMHoz3nl0nGwGhziyan8A1Wdy6cno=;
	b=ZcYduusKaYTSIyMMGhnnYV5gK2DrPQqRJzjlMtxrjE+Ja785IoC1cOWXByvSCpSEXkO+
	 hT4Ds9VvaXs4OjY7xtjtKWdNSuopILMenNbKf2KcZE4ENfaW4+PE+hII57VFtkBasBY+m
	 GMck6EITSV8caQ9hBwzhl8WAin7uCIvcO+iZ9Sy2iqTWqErJUuvUz9r+3+I1irYUCWiFu
	 uSMia1XUoC0JJ42Y7gfSPQ74JWgXekYyjdn1onCod6CrlmnCezq5ndFGGcI9ULUdv0pK+
	 s1Aq7B0HH7PUnpR1c6mwZlEdEtKTaMT/Y2uXcOi83D/92W/5Bgp9/HLdkk0K2Yqx2Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QwU1UGoL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UsLvD3Pq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63570606A31F
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:38:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63570606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QwU1UGoL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UsLvD3Pq
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA19j2543023
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HL3n5xlRKDyRhGpMHoz3nl0n
	GwGhziyan8A1Wdy6cno=; b=QwU1UGoLZJPPRN1rjKjGfwL82bt7KAKZeEDd5JdX
	lgGFryXJt2uQKelf7VO+9DwvDMUtXtsKW1QQ/b8wbqhfAp39J5cmlXdcbHyzgO2a
	1FNgUPI6aTo3UttCONl90/IFzcRGpRrSotR/6VE8gGRDUzj6sU8YmIXh2a17wpLQ
	yRA9VwfMCU67L5HawXfbG+X24BUce7/JXYTP8kVP0R/KBli/yCElfTKfr8Gi3FIt
	mtO6kya+5FGH+dMXA9RH9b9nC3hUPjqAbAAdiQUeeGMbnON6UuyNfDhd7qDlAOA1
	Y2p8jxyHgp9J0SjHhEeT34Vi2b4Whmh3OmS3Vz3gbGyMBA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkkehr51x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:38:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844e383so163275585a.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201930; x=1793806730; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HL3n5xlRKDyRhGpMHoz3nl0nGwGhziyan8A1Wdy6cno=;
        b=UsLvD3PqFbaKS77peXGZMcBuu4z8DXCkN7rEVnT/9rxbDQu/0IlWLXnFGe+kPSzljv
         nifHWWV6zi/2XQWOJGFSv4+iLTwhLa199r0Fw9nygP2u4dVQZTq/EaLuvns8SFt5Qb32
         f+DaeoT6RiFkzsoO/L0u+G/mT8KYEzjteB+yKJhBbUU/iSMEmE/8L6igzItnzJNmg0sX
         s5Wfgwz0tRRB952I+J6iMoOurk6voHot3BYCkiA2iC1BSJ3pAzztbS97GHPm1PE7ALcL
         LAG8zs2i6W01NZI0Q6OB5ixsqg5pSUjL+kWEFZjhWXj13kpy/kkGv3yO7nY9fybwKy1x
         0n2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201930; x=1793806730;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HL3n5xlRKDyRhGpMHoz3nl0nGwGhziyan8A1Wdy6cno=;
        b=biMotA6QbNFJ5ufdOno+Gn/MFC+lvDxxHqXmOzyGmUDq8ut+wGW649yRBs+rxs15Uu
         utD4n9Y46r8gwhWXaRLufOFZC9h4eVdgjUMBQEp4ntW/QGr08enl+g4bsytMGI/YNYDQ
         GGmtbe0PpNChnI18+zlzScrNhKFNHGFCQtaTdrJVxTLR25rWCdIpqFdxad7iH672QEvP
         qbKfPV/vyjCn9elOxfzKwfHmPdtvqRT+X9j5GMPxc5clYjoUPFp6xyj8dEtbfdsho9yT
         n3YxWdUlCHDbt+ardiWytfGuJEjKQQlMej3cugN3N6bCWMENpg513vEocvBQYWaddmYq
         aBBw==
X-Forwarded-Encrypted: i=1; AKwUvBzjXF9yWnH/Xh4SpJkh8RkbAmiZ/d1Mx16bsrf0qHxyxcD8Js1v+pLGwbjiOLghs3Owi/K11TVrvIFh@vger.kernel.org
X-Gm-Message-State: AFq9FYKD8IVgFsWgkrHEp9uT0aWlJitAKjW5HLs+sT9YBNdi1hRtG/x6
	Ddwg/ICI2wRxjA3f1n06wsGObTBaV4ap9qOP7bomGg1oVKIIHbFRXfEzNxzvNgZEJ17hOz0RtEd
	Hjz0G2uqePxwnxLKUUl1TYklmoS7slvZtPgdw1j7jvq8jLzHrcMfGM5TlAwfLh2qw
X-Gm-Gg: AYBFou2e1YE9Fvnu39Ue8+2kNaIsoREmfEgaPFZgTc8d03ysudVL/7IZ9yz3/7U+KpW
	NjwgggRLhL4zQ8ryJiS8qPzwgj2T+Lqh8S57dDmI9yZ1leDc29tyzjFVhRXkzoRd+BotgPtVkD6
	PniOILsgt2s/WJgy4ieZSEuGgr2YVy7IKEEOgG/ad5s5Pfm2e6sSBX+EcQLo6hPq9tPwvOIGvpw
	3Hx+Mq0nQzZSXhggGcSSIPURx96MNXZQpM0Xi1bcNErZYR2F1I/t1yfU0o3Z4WFu/Hrq74exgYk
	vcA1pxcWDigyu1qpqjMcP+LOXxBrO/WR7WiMloPYNvNNeD/hzVkHmskqCRODIUhesTZECbx1bV4
	PazkW4AKHBbg7/D25xOy54kGqH01vTM+gUFUVY/tlkPYIrszoNxEL7ueXFW8m/IEipw==
X-Received: by 2002:a05:620a:63c6:b0:93e:746e:235c with SMTP id af79cd13be357-94408a26905mr381726485a.15.1793201930382;
        Wed, 28 Oct 2026 08:38:50 -0700 (PDT)
X-Received: by 2002:a05:620a:63c6:b0:93e:746e:235c with SMTP id af79cd13be357-94408a26905mr381720685a.15.1793201929666;
        Wed, 28 Oct 2026 08:38:49 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896fesm28945e9.10.2026.10.28.08.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:38:48 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:38:47 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luke Macken <luke@phorex.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7: Add
 Elan touchpad at 0x15
Message-ID: <46qu6w6grb2alv6f3pnvefbtbruoojwemwop34bdehosz4s2dv@l6ib6qgzvmw2>
References: <20261014234949.1730808-1-luke@phorex.org>
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
In-Reply-To: <20261014234949.1730808-1-luke@phorex.org>
X-Proofpoint-ORIG-GUID: WxyZc0bRt8bTkpHkfkO0Lt_gelEiNKzZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfX6g8Dc6ZgqU5R
 vgImTYnTyV00uXIBzZKY5JAV24Ohdvy0d7VCPHpxppW6MrC/SxSIRagfzcCfNMhi/GnGhrU6JVK
 gnPSz4U7kOisou2gDcp1L6tpIPqLa4nmw/JTCOtf5/gN3fWVso3nR4ez0jIBmINhUEVfKy5AV8B
 EHP7xdd2m/nktwzfXw7NtSTxiBxWH9lc3/ZvX9J/mwqdzgKxQEqlmYio7kcjqHm19F/Fcj/1mJf
 fOPQfX3mVC5F0ohkzx15pxmUSOljHqJv1t07eG1e5KzC8pC7bfoP6i+bGMIJbd2aStPIA60gSoq
 fnAPWfVzEjTO26dIjmnCp5crb/STZBDhn8JNfllp4rQmRltfLQIGmqNIzdd4k6E0qUVW6zb7RGS
 DhLVxXymyw313t7ly1dcuVDJi2UmEw+JtBFaCv14RYWE7MszIdOC+JtmflIFrM4A0T3UETj8jkm
 f9xXnQm0MJrMqarT7Dg==
X-Proofpoint-GUID: WxyZc0bRt8bTkpHkfkO0Lt_gelEiNKzZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfX0sDPQuSBbg5F
 56Fac55lPfqHcAlqe90/pvjGBKKlqVAurA+fcivDulojcpAiXgTclqBdkxU30Q7O2352dKk1JQb
 VBhppStSGU5t3G61PbBkufN/G0zBSVc=
X-Authority-Analysis: v=2.4 cv=bYv+w+PB c=1 sm=1 tr=0 ts=6ae2170b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=mO8_gwkcAAAA:8 a=EUspDBNiAAAA:8 a=1ncODQROBz-vSmanY1sA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=InTEqNb8lIr1xazlwGwc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280062

On 26-10-14 17:49:49, Luke Macken wrote:
> Like the T14s Gen 6, the Gen 7 ships with either a Synaptics touchpad at
> I2C address 0x2c or an Elan one at 0x15. The dts only describes the
> Synaptics part, so on Elan units (e.g. 22A7000VUS) the touchpad@2c probe
> fails silently (nothing answers at that address) and there is no
> touchpad, while an I2C scan finds the device at 0x15.
> 
> Describe both, as x1e78100-lenovo-thinkpad-t14s.dtsi does; the absent one
> fails probe harmlessly. Both share the interrupt GPIO, so move the
> tpad_default pinctrl state from the Synaptics node to the i2c0 bus node
> rather than have two nodes claim the same pin.
> 
> Assisted-by: LLM
> Signed-off-by: Luke Macken <luke@phorex.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
