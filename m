Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425031;
	b=iP/B6leMj4uil+6dFoUbRdUo9bE+hgmfMatEx30sxUpZDtzIYAY2E6ZBGEYojXR7oEK9
	 FmbhLkI1zntVdx4UOh8hb4OYiX3HUErhiH3PQFh34rEuJMi7UZ1qwHodLfEwo2dwln5Ks
	 0zr1FeRnQoY9/B0/qGCBd7sgrZrz0ePUfFuWd2PjEBGiRaA9DNB4ELC9r/Eo6z+qAQNVR
	 xqeSdBQmaY5EWtZdrcIi8AY9Rv6ZYFCli1nZR3zXV0kxIuDZ05W/pC/jfGvP39FNCdyDG
	 xDwr9h1RhYmrn6mecZAJeUvvkOK2dx6A91lx2+FPtWNVRFZpC0DfUAT1PGMmdlki9Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425031;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wzI7TW5NGBdfc8a6txumUb496CNRcsABeJ+gub6KOJ8=;
	b=Nh14EW8pGvw5SgxrwjcBuDU+5AoaXdlsuhvo/qsdtUVyNBJaDBj0zbBuFrGc8KMPLhYO
	 NkrmbQ6nMW71+3c1ZDxRcdU5Y0X7/VztJBZjcKI1CT9PSbx/vyANHkk1M0xoa5hM5XEp2
	 /vsulFSSHiFwM1IsdBE60iqxiWEQ9eAITMEnNUT73rW72wSgmOXs4qGcPc9U5pK2dK+7M
	 JcHDB2M4HAdPWBCySg2vv31GORk7vKGTlalCSPi9zlLrGkJlc7Q6KVcwE/BVmqWQnr5AV
	 E9V2n3JqItLJndlRrvx8zumh3UEUP6qcyQkmgW0Y0iatViBuDgMgtqJwrBKLDhv8r/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QTu8y5jP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IYCPx7X1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF069606A327
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF069606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QTu8y5jP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IYCPx7X1
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN6Db401490209
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wzI7TW5NGBdfc8a6txumUb496CNRcsABeJ+
	gub6KOJ8=; b=QTu8y5jPqvdgr23dwcsORrMr2kFBYxoTCkR5Ob8HhGgwjsJqZnm
	BEK7IPo4TFAuRNyiIOFJ0DIMJN3naxKTAWcYallI73tFa9uOHIzaADMRjGQ9sQj4
	Z+QsKUDyiaRfMS2CLQ8tC3qEiKs8JzQqpQmP1uqpxdhDtJRIjj3SEVHgSRZgfQUY
	bBpt9r8j4CRP7I3D/I0pGsDLcKKyo8uSx+oxyBxYAhCP3d8dElXbp8DlYCtBsnkk
	smQh6XImGky/xAlmiUTvRnocH6I73U0kgsNkYhpwwZ/MqMb5b1vHbIB3Q3gV3dG0
	HgbCDPKB/xcofnIiewTqcPnl7+YAaz83Rwg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1k0mfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:10:29 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386a0f79047so2559646eec.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 01:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795425029; x=1796029829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wzI7TW5NGBdfc8a6txumUb496CNRcsABeJ+gub6KOJ8=;
        b=IYCPx7X1sJIfumthgSv2OlpRkfIwDUSVhqwukYx5mbxcizxpIzrvBuIQjc2/NBj24b
         bqssmxkRzGYre1ZQ4viz+5vTic6dAcLeqO2HvXGbQTwjVLKXcQlt3DAkWouevv8thVG8
         hxmp823xoFkXbJgOQiNXJYVFh9NUDeKaOQCtvg4a2mQryn1GWHcSYzVo4kfpYLGdq8GV
         /Pxli0ySRjaGG+a5nverAB3gzOAngoa1Yn5rjIyiFyTgdGbLJfgZMb71sNBJyzWPysSk
         A8ykCGnWwgWHqCIyYYqNgA1+Cusg/dz+pGCeH4duJ0TQ93zbw3MPmdjM8BMprZpaQTTM
         itMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425029; x=1796029829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wzI7TW5NGBdfc8a6txumUb496CNRcsABeJ+gub6KOJ8=;
        b=YeObGJzcc0SIw8rWcNUrvJY7oQlH6BCJmK8UFN0mrfZTVUJY8OLImYFiYCDUjSuJ2k
         0dBgkT+b7BQgRP7iwk0imjscz4eKejcB90/fKKGvpoYjuM1MAtX1uBAEeBJjRAOJXJIp
         4yqbWyHTmInJ2jpFwT8WpqQNwFN/yxPjagxKllEsErdaqMTiY2iR8xwzXcnuFDGicm9l
         lAuaVsTC5b41fKAUqKjkjfvyyNUl8a9X8uPxslzR0zoY3h8LR8YoJ1yOAFQc6P3hIs4o
         sXu2MReZoSHYjPsLr9rBJp6Jrf7I8WGx1jCqdh/pM/4FJH7dSdEOTkTDtiDOErC2izbF
         Lnzw==
X-Forwarded-Encrypted: i=1; AL+hErETSC7fHmJEmhiSZdtUB18EQvGGP81r4fw1eSj9sU1NH6+JPdKOREPW/wF116R7dxOGmGmZEf3uojv7@vger.kernel.org
X-Gm-Message-State: APuU4Z+wgNyMAz89G9MdVWHJBPaCy58YXeV36HGhmWf4QT1ojzzjYpPf
	3NgmEXQSjiqlM5cYFuYY038UPJwaP+m9LwKiLsiXpoqw7+IIlugFjYpcN/cXkAG6W//uY0tHD7i
	NKN7wJU2MJeAsehPnVyMpYBnvjZNUf8q6Hc3qZHGmALxaf2Pc5bX2aCT5AxF0Tnt8
X-Gm-Gg: AZFdTZe5/hllulQ4Jygq10TvBeZkdA/ruCZL3qsqSPjJ2bwC2NK68/dxCYh6YETKc3I
	Y6c+FjvVBBhHSQ3UIi66aSfPSulDM68iCszoK7fvSSCJNR2EtIVSTS7mWONyd2/swQoV4gBBx71
	awfqpMIqfQiNgXJXnaMyDMrZtjxzCtynA/euY98zevHaUu6K1B5w3QldtfDlRkD/MRIoei4GWP0
	zNeYODYUAEEIeDOliWw9wz5oHI7urTsm3Szbgz0jdl7roMxRKI+xWq+df0fhCJo1hpqcBbyhhos
	BGGDdKVYE37hyg/UoZMnSSEzO4wkEoRCyER9BxnGFKP1xRHJ17CAEGlzR9tDzUWoAR+Nfzi3ywT
	ufDtdZHq11fX+MqH2dtZhhRknD8elqrQVy8Ec6WZVDLRWz+SH4paPFvHe6Ie1jGw1JD8dbzYkcA
	xB6A==
X-Received: by 2002:a05:7300:cc9c:b0:386:a217:aade with SMTP id 5a478bee46e88-386a217e7cemr6162010eec.29.1795425028438;
        Mon, 23 Nov 2026 01:10:28 -0800 (PST)
X-Received: by 2002:a05:7300:cc9c:b0:386:a217:aade with SMTP id 5a478bee46e88-386a217e7cemr6161977eec.29.1795425027969;
        Mon, 23 Nov 2026 01:10:27 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm58687105eec.3.2026.11.23.01.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:10:27 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] usb: typec: ucsi_ccg: Add CC orientation sensing via GPIO
Date: Mon, 23 Nov 2026 14:40:22 +0530
Message-ID: <20261123091024.2214918-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzNiBTYWx0ZWRfXxc+DfHDxHs0m
 16rMghs7e1B4O3LiksTC+mmLXyD3JAMLrO094gJGmWZc/Le3JRdw5kyYTzo92pgYl7QlRP0FTzz
 QsDF7juJO5bWiTKPyBYT5RYKkzn99Gk=
X-Proofpoint-GUID: mEfWb2IdSl-fgDdn3HYxJCM4vBnJi0ca
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzNiBTYWx0ZWRfXznxbtKyGQILG
 3MoS6KAyNju8cr1E8PWgKRhcB97cEQfwtRsecoGmpnp0WBrdvEtYziPpF2Wj/MjpGmJIqywQ4Iy
 GqAs4DgAxFlVXaaui9b6BdcGXsUZtytyfaHocPdXcuTND7J91o7suKyQU40Pxx8ugKSZezR8z2S
 1mgHFdJGxcGJFNP+ZSmMccRAPasHwSABVpToQicDjpSd+r01+UPrg8T4DOlOQGrhemVy9f3i6HO
 olTIMpc5Veu5MJcbC3g1j6ZkdIWtxSI1tith1ON984zwU2yPCV+WVSXb+mQP7n4fWI6amGPw1Km
 Y60HhBF/d1ACxXeC8DyKKRbKgM4vImslHjpZbIFG99Zbt1HgOUbN5eY4rf+ha41MNMHVkmET/XZ
 R6/bM2IPD0ZqGzauWk2sRN1uEVZ/13xj6kMl1rFrxDFof8BrgrwDfKJbWdE9Gl+Wn7VS0MyN8ac
 2TdklEad7B2GWTom2QA==
X-Proofpoint-ORIG-GUID: mEfWb2IdSl-fgDdn3HYxJCM4vBnJi0ca
X-Authority-Analysis: v=2.4 cv=cpIOAF4i c=1 sm=1 tr=0 ts=6b040305 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=ho7CR9d4k8WB-Yxh2A0A:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230036

From: Akash Kumar <akakum@qti.qualcomm.com>

The CCGx chip has no HPI register exposing CC polarity, so on boards
that wire a sense line to the connector, pick it up via an optional
orientation-gpios property and report it through typec_set_orientation().

Patch 1 adds the dt-binding property, patch 2 wires it up in the
ucsi_ccg driver.

Changes in v2:
- Reworked ucsi_ccg_connector_status() to return early when the GPIO
  read fails instead of wrapping the call in typec_set_orientation()
  in a positive-case conditional (Heikki Krogerus).

Akash Kumar (2):
  dt-bindings: usb: cypress,cypd4226: Add orientation-gpios property
  usb: typec: ucsi_ccg: Add CC orientation sensing via GPIO

 .../bindings/usb/cypress,cypd4226.yaml        | 10 +++
 drivers/usb/typec/ucsi/ucsi_ccg.c             | 77 ++++++++++++++++++-
 2 files changed, 86 insertions(+), 1 deletion(-)


base-commit: 8e31dedb9ad496ea7dd7064d77d6f7d459c1c90f
prerequisite-patch-id: 0ffa67d7d9ce66074ffa2e070249ee5b0cbedb2e
prerequisite-patch-id: 65ba14bc52b50cdf47ecdce1f4b3fe678704955e
-- 
2.43.0

