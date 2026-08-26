Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F393D9558
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787739718; cv=none; b=PxfS8HdgzHlITtZtXKtODzdKCCBJDJ7XoF2/otBpERz/8xQcxvzFlq5TyCS9LZOC3UWQlCkThShBMfI4ebdl7t6RezRi9TzOHOjkwTtpr6+Ero7jAiEylBz5SNGvH3MWmfLkWIR9K46FoJxL/lqGNdGL5Zu4u+lADPpdhAbYCUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787739718; c=relaxed/simple;
	bh=dKa0bkhQNHGF3ECM0RaphHFXMQfLxiwcJfDby9lcfX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CYMD1xNS7j7hqq8qRNNILzin+LOxDb6AdAULNcqgOOEu6DlqK1n1teLKORndRsvW7gcEGXY6Brb9yPGMXfgaIF0WWSrJaQ01TySsfEHuJfOVFbX/rh+U4HHZ9R187JWoHhkR1kimZGswO68jplTvddZax+IjaNWpWUElneiQXZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R2NKrtbG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RYdAFw49; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R2NKrtbG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RYdAFw49"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGaq0121385
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9iZ9pKopk4L7oAcIHq+UKI461gaq/BVhdXcIs0vKk0Q=; b=R2NKrtbGzA+fbE53
	fp5DaoYw6a1ce1VdiKSobg9vc/PQRmVCRtwTKSp5Pbce9wd605scZELO/MXN6fkI
	/cYpWPg3Y7ReAEqyJzMlVY9KT9izzPq5Y40IEwf3A7379WDkejSHWRObj/IExpXO
	Eze544zDu3cR3Ad1H6XHqkuZ6SxJ8PxWukURFtBsTOy3bqX7wzEHPI1+FWepl/WM
	3dccThHheJQ5KKEOQAv8oLxAcgS1iJwDKl8Uj5Qu9k1UAhlNHZ4kha9DlpqPjCGj
	SjyyRD/YBcqdQOVEwXU4GfCLpjBY02VjhGfMoENw6IhwrRrjKk6wCRL8rOR5oCyF
	EiF1jA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9smx99w1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:21:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52d33c89a29so9592151cf.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 03:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787739715; x=1788344515; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9iZ9pKopk4L7oAcIHq+UKI461gaq/BVhdXcIs0vKk0Q=;
        b=RYdAFw4967z0R8NAlLHDbBLWa4CwM5l/SF1kK0+5B1ihQbvQx01/ecVf1WHXl8AlxI
         gc9FvSWHAicbcZIYaFCNOEIvg27HUCbugwnN7WAqEygBucy+tf+YLpu1RqYpKy2JTNLM
         QSBdj2fpghR8Z3hZtBnJ3a9ZRnsDjIxCMssVgqyU+sz7XpmIT9I/Dqr6TemHpeyHcTgF
         kDlj2Bm82ePffLuf9HXoqLR5/XBd8r5oBVIbVKNA0Y2FTqBST8ZoGzaaS1X99XmFjsUq
         QYwn26AbZMvAYpDWRQFLI9WITYUMYIAL5uv9l77H/x6LBCBnKvxzzN1Awiw2hkDDlpsC
         tHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787739715; x=1788344515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9iZ9pKopk4L7oAcIHq+UKI461gaq/BVhdXcIs0vKk0Q=;
        b=CQc6vc2TpTRpctN6DtSI+ap5Kf3shJUskiVCwgvd7U24pGxjslERvdriBJ5fxEiM0Y
         9cm1rxeauMBKwIzxEPUqrBH0pTBBmMnMktoA06ysgkHEz2QPSH/+kFWMMh04t++sy0SM
         mZxzIsaSxNWCHhfRG+csRHVYe5uLXprgkuwrkKPX5BfcbrHXGMHLPzMUOZzPzkpiJGZ/
         jo/usqVWG1g9NWIeTzN32WAoulaFAoy50JLBLPKLLtiaVOy+xXC8vSKveHDbw9DC90AQ
         lENJkAg77C+nCqOjEpYgdkpiBjwacj09B9AdXaPDAkUKMH3Rkih03yZLNvYz+z9SwQyP
         eVuA==
X-Gm-Message-State: AFuF++lf3NZ4siafu0qbS/S5pQWCu4WKXyH0MpAV4XcZ9jo8V4/VHFfj
	IoHLlY1PhHd/RBHTy/8g8PPl8lqafusHlsLlIyjDwd08A23IDiuoBfcOvkvt3GQCHSlqo97XzjQ
	STPaJPlsfC2s8szcEo1uHzdf4zMM6t0ZTIieOP50a6IWa8krZYAM0yZFjgcBLnLu3
X-Gm-Gg: AR+sD11lld8jm8Z5Box0sy43FK4r18uP9CM/GC6UM/GKwz6VtNhfaH6KmqG+VG11je3
	xOnnJqJS4O2xtRxP3cgbDvqTthU/bhc+F+uC5r91ySQjMxRf7AfRJIQuzS+oSpqmng/8bVYwVPJ
	Tb7CMqgrjIa5zEPcDBRnWQ3AUzvljthj7jDBnf6t9KUkPzphTlscyZ7kWd3eBAZv1mqfFC5O2Ma
	Ousla3+CMcXngazn8RSYFzhxp5N54Ven1pa2XTllNZlfI+pH0iqdrK3SvbArHBuDuaezPxAA+R4
	yZ402n/ivozuAZbDyTDJ+rdZh2WFa+WOpRzINNLgSL2IlBDa92qSdHREfXzr6D8hPX1KBGbvi4k
	GJ3Ksl8KU9aGHt/YUwJgmq9k=
X-Received: by 2002:a05:622a:1903:b0:528:3882:3869 with SMTP id d75a77b69052e-52e4228dd23mr55042181cf.13.1787739715040;
        Wed, 26 Aug 2026 03:21:55 -0700 (PDT)
X-Received: by 2002:a05:622a:1903:b0:528:3882:3869 with SMTP id d75a77b69052e-52e4228dd23mr55041891cf.13.1787739714627;
        Wed, 26 Aug 2026 03:21:54 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9b106dsm479830766b.43.2026.08.26.03.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:21:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 12:21:31 +0200
Subject: [PATCH v5 10/10] MAINTAINERS: dt-bindings: Include dt-check-style
 in DT binding entry
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-n-dts-style-checker-continued-v5-10-fdd16ca6e771@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com>
In-Reply-To: <20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=825;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=dKa0bkhQNHGF3ECM0RaphHFXMQfLxiwcJfDby9lcfX4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqjr4tGyf6J2cmg24IXvLqA+NDv+ezXqqJssZ17
 xt9mHI3MlKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCao6+LQAKCRDBN2bmhouD
 1+5aD/952Umo3mfY112dTg11VDIbpOOAwB1DGlweDvsC6hHg8DJaPqJnP0wzTun3WkkWVoVFqXf
 y0VjxWPjsoIkdE5XAXRI2rvnlISPYDhjihL30h1YK+br9N/V3UaWMVOw4oZS8B0/lj3g8ONQCea
 S5ha3MTErO/g7siydY21EMksmTGeGsHy4XktQjR8iQ6WACxabOeFLCTRSl9Nzeu8FB8BNOHWMs2
 wnpFdWHZpXE8leIUbb2DN5tpFc+P4lblfrkLrHi1cqYEFxQ7VUnLETY0Wa+ZUrBc0uA+uSaTOaU
 LQJHz3aBzagLz+R4IxJe1h1DBkL2tfLYM8w9GNDuOEy+29k3a2QHeW+Uk20wqKd/VeLdRKtc5eY
 LXxQFnGNDRImqTAn3FoZ77r2T6vjoTmjN1KfyRdu+YrR724MPyyLuYHNX5T37fiMuK+23AoJgJy
 3He1lrXIw8bn7QOIUYwf2rRq1gzTjRNj8SKc8mJA4+kxnmW/qzL6/fZTgcNZCKli8EQdW4ZMzYo
 9ZJ0ftwScVh2r+J9DREYtsfxJkMY8H70RsgKGsYsyiw6Px7YFQvDZQ5uKl2scCSQAqG3pAbOaHW
 N2r4j63J7abqYirtYdDCFXV+wynYpstAe1Po8+tqfzoO5m1FIv6R4n/KJEWh6RC7rm1WAVBSEKs
 Ip2p/tK/pO/bToA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=O/oJeh9W c=1 sm=1 tr=0 ts=6a8ebe44 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=hdCJvu6vi-O6ykQZt0QA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: tkgeV8pF_Fo6wuZ1zH7oa8wnE3-PkjzN
X-Proofpoint-ORIG-GUID: tkgeV8pF_Fo6wuZ1zH7oa8wnE3-PkjzN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NiBTYWx0ZWRfX6pSOiMKbStKu
 66AXz7tpZGJlfip47hZ09aqFjaUC0DIKQHlqL+MhXjcn35UsK8wM7JIKhHLx9W6AZSrDinJ7uxB
 JstlESC+ooPTFgdAMHqbBr2WaK2XisrKBJ+XcqX1Q+SZnBORzFNGJ+kL2Mfdl2P7WzN7OqSDejr
 P3nHRKXDWXZgBSwedqMyDZuwITi9Omfbek8BBC3PENJBhweJa05N8TWNnwTlFxlLLkBd5cfb/8g
 5GNrA3zwr+pd0ftWwCWhAgwej06gk+Nt6PP6KQ+bE7SHY9AIcroP1Qnfr9keVoCuuzjjwEGS23x
 bLRyskMRT4hIoxORdzbpmYa5lmTAfp9SidIZfqWkL28MwAxsrg56CCdMbu+k2Ge6A6AzfEEdX+z
 u9226Arf1nBLN1PlNpeQgxtysZfjwodR8rIgi6d+MRUytg4jH+58OiKnT5fhsOu/8N09Qkn4/jM
 IuO15hWXvyNw3aoB5oA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NiBTYWx0ZWRfX5iZ0utGoMRw3
 13hXCIaaaoBoDea4LKmuxI2FVUdRQQyzecjYIpR0ohtFraP5dY9FvZrFu7aavRNFGg1nOVxVjhZ
 cXUdPewezNcnL0Z9rZ/vett68gyGTDo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260086

The dt-check-style tool is in interest of Devicetree bindings
maintainers, not only the driver OF-core (where it is covered through
"F: scripts/dtc/"), because it covers the DTS and the bindings.  Add it
to the DT bindings maintainers entry.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fe10d29b7657..59ec34fc9682 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20488,6 +20488,8 @@ F:	Documentation/devicetree/
 F:	Documentation/process/maintainer-devicetree.rst
 F:	arch/*/boot/dts/
 F:	include/dt-bindings/
+F:	scripts/dtc/dt-check-style
+F:	scripts/dtc/dt-style-selftest/
 
 OPENCOMPUTE PTP CLOCK DRIVER
 M:	Vadim Fedorenko <vadim.fedorenko@linux.dev>

-- 
2.53.0

