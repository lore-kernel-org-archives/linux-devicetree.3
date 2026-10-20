Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792534106;
	b=gnyvVQXmw/dSryX5aFNYqXkXLOsze4or0Zb9/1EAnBuHm3r+kWPy3nHFqL1ldSK7HJzE
	 OawPYortKyOUTw9RHlUn4+JClF+4gLjjPpbR85CGT9+sCGZFHxnJg28xOBQ8yZ7gkRruf
	 Z9R8Bazju+iAEr6o6jP37GcNfqOZ+Cado5vShWAdtIWRpgtnAPkL+c391Zg/YhZBQjYMS
	 Qjk9A4iADNe8wA2q8tnYtnzzzcX5qAfrmkff6+pIIS1ls/YdSMskYubVr9UdMdnfFCmAw
	 DHfnJW+9BuRYhqZ9ZVYvhxhJ2nhph8a8s19Cs0m+bWitaJKELfuAokAKKr8DbKGXAww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792534106;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LvrfjD3yEpX3v2qha/GP6cEVLRQb3yl9/nVMpyayXVw=;
	b=N+1MQX7Abj38+P/dZ9hrS4xxlZvufVgDnDDVdiowKRjEsghjebBx0xzRKXuo38Tge4jF
	 +vpGrcmiq31jsNejz/x5pipNh32XzOiprPRzEcHAAUgk9i7BKtZsK5Epep4lmnmEAOvva
	 /LRwwa2KaeYHIPWKvM2dnGqJJNyaiCGF7gDYnDSo9Jd+G3nOJ0MkhNmh73vR+r3zhGhx+
	 /S2OD621lw20m65Ajedwl4/q6hvqgZI08TxU1l+b9ol9Mcoin6JhenTfGh/XAB6vp2/bH
	 yadBttlTOuzj+O+QXZNG8ScBzyYhBivyiJq0RBFD7XX30IGmKtAd5/TJtGJdgkLWu8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YlaRjfcq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VYJvx1au;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DEF606A319
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 22:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98DEF606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YlaRjfcq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VYJvx1au
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KKtjN91890303
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 22:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LvrfjD3yEpX3v2qha/GP6cEVLRQb3yl9/nVMpyayXVw=; b=YlaRjfcqXcboaVER
	1sRzZAh0HZmehbrFy3UhCVu3vYTichraLfUUhymZp7bS8WmM+1ILHlTWUJND9zH1
	molG1kOsh5qZXu4oWndIDWnLZYCKH5bhpLi6x7KTJOgQfqirofxKnQIxaeQxDMmZ
	T1ptdo6i4RT/9PpAHw8RWDrJA1UBA93lUQ6EvzTa/qWKVJrPqHe/hpRFmntVORul
	huURSP231+POlZc8B4gHgfOJibHq2Z+pltWIDWIcz0cUfyUsdLmvtm8pRMYXLrF4
	VPqplyftx/lioIukz+3RRBitIdinjEeC4elRpAXXTxtCIBRQwUlcOeoAROSmvKWV
	sCuQtQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd166e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 22:08:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e9501034c4so1051165ad.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 15:08:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792534104; cv=none;
        d=google.com; s=arc-20260327;
        b=l7dLMeT3SLpGFBkZAg02P2oXArXIcZdGfCvkxzV+7CdE2c2lhO+ikeU06zsdA+QaTC
         U0pRnzi7hDw2n7Q2r98xaVcwciTZOIpzy7b2+GQZjWdspq5A7yIwqdMP53DF8ShkjkJW
         q20l7UvAsJyphDOthYIdQCEhtXhDUVJ39JMxqIUcnabBX0G3u8KKftSPCpi49tjhD0w7
         Agt+negEVQusmX74tcCt08AEum13qqS4T8LQsK23aNuICax1Lz5l4Yqp3aa13B2NB85j
         6AHMUijKNQh/Ajw8hLkAY5w7LhApon4CQNj/QwHnZO/6mp8vDXSWNQ6Ky6tbaKMr35z5
         wStA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LvrfjD3yEpX3v2qha/GP6cEVLRQb3yl9/nVMpyayXVw=;
        fh=M+AjuPQ2fXL7brrmAXIweWDR9olhuR6z6IAFh1MRIrk=;
        b=lyCFlKmyPgfqIxBrcz41Hy2mUsNcihTwdd2aUiyrS90J4EJ4JLXazWOz+r/iuDRn4n
         KvAFRf7uRG1Dm8pEK78R0R9VuPmdhSzConfecVLMUfi7+wwSQznYsPDYAtUm+bcoYeo6
         jOcQLQeyyNYyMbI/oVxG4oT3Rfpn4vmfiZ2eoEDofbcqLFzFmVJ9OS/IcmDNkBqNRggk
         odfx7l1KHbTGOGB6uBTYU/r/8ZMUQnjghr3Zo6FbL2cscPC3oVSb0EQlbmCD8XejOmEW
         q9Wi+9GwlBAAqt+7mnl+uou3GDy+mb0uwWwwac19SVUOQxPhvyiPTj2I3LXRNGb3AGGj
         Nzdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792534104; x=1793138904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LvrfjD3yEpX3v2qha/GP6cEVLRQb3yl9/nVMpyayXVw=;
        b=VYJvx1auuDRH2wVC08tOG9Z20YTD5JPjYHPtr69HH03y8NFtkUZcpGNLud3yPWIP1u
         miaymRq2HtxRfK6hs/X4WIkzzAYxIt59HyXwmDxmKCJlrES/2eqUjmZp4gjJXWFkTRl7
         U9p0gygH9rfH/75K96YMOdfoTuHvwtYJnj3rEFlfT4os85Vjb+hPG+qrDGs6u4Relznb
         tKnrZ0kK9mQmeSZtDJLi423qdZ8CuVYqdOIHalNpruqMDr1Ji//ryJZKdzwhsGDwbmfE
         IeEt2OKM/hBAcXFo0hZ1cSjnp0iPm1TUBzAgiqHOeqwkrjIMMMTeilnuummXGM4wtwqj
         t89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792534104; x=1793138904;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LvrfjD3yEpX3v2qha/GP6cEVLRQb3yl9/nVMpyayXVw=;
        b=wqSGIkF6lRr1vS+26uAdwiHONR6MAed/VvWVOS6PrK56tpsnUCbV0RvPKHLh97f9QD
         ZX3kR8aE3P/aNEbfxjzOfepwEE/6bD48Z0pnGduArVfv9Y9ob7ujuUC+/mvuNIHdLnOV
         cDHjJA3MYJ4r2U7buoE2YUvJ3AxmpezrePQ3UVdrMgvRmtGJXuhsEmp2Updl6cYpIn4b
         h4QaoETCTP0iPBUKwVwnF4fcZ8BHnLQKmCJIv4rafDVwG3+D45QNICfNgF5j2AOVC5bg
         EoiWHqy4F0XsxWETQ20a2694URzoWmdtItqaOw+DmunHwJ0o7C+ZMAPz9YzRpkeauuCy
         GlXg==
X-Forwarded-Encrypted: i=1; AKwUvBwQFGuEWacrFFaDIXgGrJcfVcpEeh5cwmzGBT+NGwc3KXjkRo8zovxSCd1cAahOh+RbuyFPwI3chJPJ@vger.kernel.org
X-Gm-Message-State: AFq9FYLKs/qhd5BE6X9C4O78CwBKYGsj5UDG9P9Pddae8HG01Hl2rJ63
	IzoBH1uiNn7R4OapnKir4UeAhBbXKoUl/cT1YRccynpF6/8FeMZUIZoT1Cr2iD0DlfbokpIHqq2
	m1n6dO8IMuVj9r/JJ6xamVWjLGkTF35EvWv5nydv4ryYNU9AMJFUhUWcK9TuIGnZlgFbhVbUerT
	iH0Oc4IK6OjK6/y3r8ffqAmveIIALhi2HCbXIbpeM=
X-Gm-Gg: AYBFou0IaySOfd7cbl6yZFI3WIsxvf22+dIDozOGgaW+yiIXMpVUMDpFvd/XmZaChZf
	Q/awbb1JP5R9pCoQQXEpvzG4jUviitPrg1o7bk8XvWSocAh0jplB6R8C1U57LToXZRt3qKJugSq
	cRakdN5GNN1wf9CLoHe6J+RlXJ0mZJ/pjiaJ30sTDa24SsxCSks9IuoLnb0j27r/cfXApXOG+6E
	pDOlN3K6o1qvuYmy9clBGkVL0FvUlbLThLjUzj9okA+BDg=
X-Received: by 2002:a17:903:1b4d:b0:2e6:dcce:8222 with SMTP id d9443c01a7336-2ea43cf0d3fmr947205ad.57.1792534104138;
        Tue, 20 Oct 2026 15:08:24 -0700 (PDT)
X-Received: by 2002:a17:903:1b4d:b0:2e6:dcce:8222 with SMTP id
 d9443c01a7336-2ea43cf0d3fmr946955ad.57.1792534103541; Tue, 20 Oct 2026
 15:08:23 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
In-Reply-To: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
From: Loic Minier <loic.minier@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 00:08:11 +0200
X-Gm-Features: AclHuK8EIJ8ZjWBQ6mFXW1Y_Kcn10ejjzpfnSn9R3N6EwnixFcyxmqimJkA2vVk
Message-ID: <CAAwKf-ftxr5fw+1Jkz17YCROjDB1G+7aEZnDyD-zs_d_OrWJJQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Asus Zenbook A16/A14 (UX3607OA/UX3407NA) EC driver
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4OCBTYWx0ZWRfX7If2nvJSFj28
 1KW2Rd7cC9qBUD8X9cPs6VJK/zjGybN8L8C58/x98PW8TLXTH6A66M2h7uk+7o2pVJ+jYURxi4Y
 2/bLPwpU0+565SLOGlDy+sw61PCPdN1PRZFuqNthBVrXluYdGsyth1qFsqIn/zTJTO6lDDfwLdx
 W8qvcr4vAvfO1d/1CxYuZQ8qVVuTW7LP6UGU62JPK+MKQ++L3aKd6nts7HwkJTkmlu8b+fwdtJK
 kKlyuJaXx7arLtr8dx1aSfKIfPlgNdVwQNlt2MZm4tyG85mhDGkCqJkzYu6vteRV6DsdA7AswWz
 Jgw5dkX56dot/L05zL8UT8L8ta3D3LkSAVKYGbCTOhibOpEfehAw3bMIvrbQSaKlido5BKqhHzV
 Akq1N9dXX4Q9DquXJzcwYbVFe6trfYOZIto0/Rgyz4eMkpQzKNaupd+PbGzSRVrIzmdhV4uiNvW
 +UaI+eKW/cIMGRuTtcQ==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad7e658 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=bO4u5d9499Dzb9AJ53AA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: KfXonXlx1ANC55TxGvNfK4rIDHq9lvzh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4OCBTYWx0ZWRfX2MytYeTQze8U
 7d5r6tUT3SecZzmD0xxp/Jh/wBpqlbaPrsAyl3P1IR4asnKcq2t09t3P2NyQ7hm7B676D5g7jzL
 QV3+b6Pn97/xQ8JP0NC8i3AePgQR/CE=
X-Proofpoint-GUID: KfXonXlx1ANC55TxGvNfK4rIDHq9lvzh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_04,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1011 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200088

Hi

On Thu, 15 Oct 2026 at 10:59, Konrad Dybcio <konradybcio@kernel.org> wrote:
> The Snapdragon X2 series-based Zenbooks come with a bespoke embedded
> controller firmware [...]

Tested on Zenbook A14 UX3407NA: hwmon temps/fans update with a
stress-ng load, keyboard backlight levels 0-3 work from GNOME/sysfs,
suspend/resume works.

Tested-by: Lo=C3=AFc Minier <loic.minier@oss.qualcomm.com>

Thanks!
- Lo=C3=AFc
