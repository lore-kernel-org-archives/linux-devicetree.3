Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565222;
	b=nSSAFEXw05dgVzYL5xFpVN3/Nr4ElgSSan1VDb/wHrWoTaBMOCjt6Tek9JSFLr3Kt/h7
	 PFIm/Ti0o8lHD/iHEWfivyxM1FLbN685/UijxO/bj9U1qF0IYwUstXm0N64Gb/Vdd+R2B
	 +dhmUEWa10ppNmpnCEqDCcAv/XOSzjnrDniWaAayEpht6dFATkG1s5hGmv83erBPYPiEL
	 tNGhMpdUio19hxTHlP3jecDL6BiPgvsuAx2PHuaTpVWX2n1ifD3GF+TTcEJCMaypxYJXO
	 4UswFUizMRuLswn42AarhbV148AvMbxY8usKoaP8BTnzlE4wdZM2W8lyhub/wl2Pc/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565222;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UyJMvArk42W6bIBhWSb3g/nU4qxfS0ShEh08XxU+948=;
	b=BEiqZiRhQ0GoG8dR/y6ilKbi3tChiXgUxZ+51MQbGU3T9JRao+ujRz7wLFlBn66Tn8n7
	 rzliD/qmtvmFnSPBIbi40dTfW5vVXnZxNP9V1Si706ACnmCaMwnixoFZt7buqtLFJTAgq
	 KI0jRghDNzNpiNSPXuC7vx+j7tpyA91X88j7+NuQdCofCv9tjp+lgc+G000ORIMZaTbE+
	 xlq0n1mpKumataeDz8ihW4coBa1f0BPyYuwcMhEwRj0THb7ctyfX/ZILAV9ZWBrY8vvdk
	 CqBUqT5dDPg4M3yAQfIil/8x1DSqgZjaYwVrWHUDWWgkpfAslLwsltFhUDLyxgc9l/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fmBTTkKp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MDMnkaoQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD4E606A321
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FD4E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fmBTTkKp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MDMnkaoQ
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMb5UH2656350
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:07:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UyJMvArk42W6bIBhWSb3g/nU4qxfS0ShEh08XxU+948=; b=fmBTTkKpN9qjMHjP
	aI5W3+MqVvpEPqvq2lQTgJzVSIcEPyd89ESxteRsZsmzrysbPJvzVTo2mlAbWb43
	Fzf1GJseclGIgqXPzHqAi8FeSg2gzPKsXI0f5yRb1n6Md6IWFYl4U/D8MW6psH3k
	peXAIJeMENIl/LYx6fDw1qj10VjOb/QeIcpI5C55L39j1Pcf+0uB7uo/mqOUV40H
	kkT4aB5vPLx3rzFmjCiNQOzouM4/EMdbURpScMm0Ovzevau4JoTvkLSILA8CnEPR
	Bhx8I0lJ0KL+QGDhmthyvqlMQNIv4I5J4KwVBlpM+CE8zjZNr4J+efz2O3ppmLs5
	hvsc2Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5b802pe2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:07:00 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-383ec96a7deso5755964eec.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795565219; x=1796170019; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UyJMvArk42W6bIBhWSb3g/nU4qxfS0ShEh08XxU+948=;
        b=MDMnkaoQpqNLYerRMHiL+JHvncdRMXVzcaI1oqHM2lW8yPp24GXyRMSa5nRtQoG7gX
         9/0islUZRMnUwB7fYteTEs4/E7ucWQHmVIZcDDsyz+nj/RRhbQan6gKyNv/0/ZtuILtr
         lOgkBIQcrAsvHwGteeWzwcS3fL4lXHFtowXwPzx3gqSqPNrlpSFHb3jU19HlbQPiBj0W
         pT+iZL0zz+KjySK3FsrHpll/S1Dw0dhSgon/+8Lyk1AFjDX2DH2+APgz0sBy83P82fqK
         ItNHeBPI5EPThBH7oyNXYJz4j8zhJFcyqQwcUnjCD870X46qL4kPuDXDMxnMvVXpi1t7
         TC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795565219; x=1796170019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UyJMvArk42W6bIBhWSb3g/nU4qxfS0ShEh08XxU+948=;
        b=ekUmCx06MMyZRi0+zaUsUBZwsTKYnXgLWGdyoSjh7GBKkMTgthyyMV7yYj2fFi8W5b
         34VTuefHG0cfTvTuqTgvS0CVwJDJMngJ7aAwgeKmxNjwDVny89z/aPSVBgDK/jcL2QRR
         mQFF+BETkL44z45liu1CEPJ0vyfORTqhPk9axgxmIrAoFf9DUjDro4seZkmdTqxSOPl8
         Z+n56/CRTD67IgwmneAz5rhRK/leVk8mhuIF60RWnhe0oC6P1qx/649HLGB/NhLk5x10
         V3zhgSkP2x4HQcUoJF6T683nApQMqPgws0DtUDLtTFkZMvm75QP3wBNYprMzHY58onMZ
         ac0Q==
X-Forwarded-Encrypted: i=1; AL+hErEjw/Sgz6iTIEOW3qHRqZhESEHLJc7+cxu1K4KwLp9OCOXTkpi9HpuZ92xfU9cFRtH9w/uDUXxgm0Dk@vger.kernel.org
X-Gm-Message-State: APuU4Z/1KpWyOGfRnPbuKN0nWq26vrOnGpEJANkuF7BgNuy0hfXN64ik
	zllgD4WlUT5hycUugM7VKICfPyByW5C9Nz/l+C7bx4efLYsbzEHgE72H1N1Pmg0BO+7h0J2r8x4
	gFmqv7D5I5C5NRQI7ZpgOlcpaMMoUzLhOHNbkzdJaktcSPrLLppM1FufoVSYnmq4k
X-Gm-Gg: AZFdTZeGsGxv1aLMVwUc2akBLpHYv09xfWk/YV2rKj+NLeySsDZjIC9BJIfLWHikeKJ
	aL9QXiGE9KPJkiQTe6rOgsS5cwTdiIT3leVV6f4tsQuNZ7t5iXuITwIcdj+WR4H+uDIQ8WtvLkW
	odgcccw2Ccx5nHCawKhOlmiwPldh2jVVnW/PZSQ/DR2RH6RcJnK2HlznCyzYMfo3k/Ugq3LL0ED
	JZvVSti/TiFGNgfZRu7HMTnvUuIp0fYLDSVfCI3Db5SQDHxRVWXTxG6ZSLKSQYcmcJy9cMgTJTP
	87CaJIx7fh2lYI3ckVwX8ifkBC33kUGbBveUEAhaCHWVvPmxUXqLYpqGINRdK0S75dI5i5tv5sj
	j7sfBnVKwD2ZbaIEqtPZJevfHWf0VHSwAa9NNRgTMxYvyExz3TCL2JJE8WA==
X-Received: by 2002:a05:7301:6908:b0:382:f0d4:1e77 with SMTP id 5a478bee46e88-38571219f03mr16835619eec.36.1795565219376;
        Tue, 24 Nov 2026 16:06:59 -0800 (PST)
X-Received: by 2002:a05:7301:6908:b0:382:f0d4:1e77 with SMTP id 5a478bee46e88-38571219f03mr16835599eec.36.1795565218810;
        Tue, 24 Nov 2026 16:06:58 -0800 (PST)
Received: from [10.213.99.236] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm47494708eec.23.2026.11.24.16.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 16:06:58 -0800 (PST)
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 05:36:42 +0530
Subject: [PATCH 2/4] misc: fastrpc: add HPASS domain
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-fastrpc-hpass-support-v1-2-cb1d46b29e3b@oss.qualcomm.com>
References: <20261125-fastrpc-hpass-support-v1-0-cb1d46b29e3b@oss.qualcomm.com>
In-Reply-To: <20261125-fastrpc-hpass-support-v1-0-cb1d46b29e3b@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, quic_bkumar@quicinc.com,
        quic_chennak@quicinc.com, dmitry.baryshkov@oss.qualcomm.com,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAwMCBTYWx0ZWRfX0qJz6pHRuHaa
 3NsFjnJ44SwwjBlo9cDlTzMurpBQAPedwqvy/OiQ/nlWrWxULTWbLXLu+YauBwQW+4S9VE0ArRc
 ElHoh1hlqe449ACvZsCW9M/O27R+lvh+jGLYJmUVl3DJGziskCTx2J7VIAVXa3v22XKrGWWOPGr
 BRNhHPOblHyN+XWYpZrJvRBDwelCRybhvJSJvr0EmmmfY5dHUHHqIyqPdLOejpqFl0vcgUbzfmk
 E2F9mVyi1Hk3qt7uSu8nA0xGPfHZcImnfcVA8HObSrY8HcgOqgko2oybKAwtDju6Zo9RfQT6Sip
 blp0p65/JAqQdtOPDOM3LHH0TL/iX4LEtdIhwGWvdJw4J3+X/a8Aem6EE2gPSvIQYEQmCKuJpCY
 L+4+DHQ3orr2udst1b2xc1m76f1aDNnHB9yKCBAxUOuKyy4WhjoYCFtatXBuz1ahyySemRRPOsz
 Git5h/EI1zpVZsY4wJw==
X-Authority-Analysis: v=2.4 cv=K5W3jCWI c=1 sm=1 tr=0 ts=6b0626a4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=yezPJc07dsF5jmqqbk4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: 5D3EybSdUOQJ4D_U6DuvLxsZN0jERKmc
X-Proofpoint-GUID: 5D3EybSdUOQJ4D_U6DuvLxsZN0jERKmc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAwMCBTYWx0ZWRfXw1OBpCcpQltx
 3K5AjWIXGckVBcTzlIDiV6IXNKyPU6fEpEirGhQj8V1bMMw27ADRzVYZ9aA6+uhMSYMTM+s4dRN
 QGjO7avtn2braGtFt0V3nkxEWDam7OQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250000

HPASS (High Performance Audio Subsystem) is a distinct audio
hardware block from the LPASS-class ADSP used on earlier targets,
with its own shared resources, audio interface block, and additional
integrated processing hardware such as HVX (Hexagon Vector
eXtensions), described in the devicetree with its own "hpass" label.
Add a HPASS_DOMAIN_ID and map the "hpass" DT label to it.

Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 9e760f68bcaf..c515097c3d3b 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -35,6 +35,7 @@
 #define SDSP_DOMAIN_ID (2)
 #define CDSP_DOMAIN_ID (3)
 #define GDSP_DOMAIN_ID (4)
+#define HPASS_DOMAIN_ID (5)
 #define FASTRPC_MAX_SESSIONS	14
 /*
  * Extra ADSP sessions duplicated from the last CB, as each CB supports
@@ -2497,6 +2498,8 @@ static int fastrpc_get_domain_id(const char *domain)
 		return SDSP_DOMAIN_ID;
 	else if (!strncmp(domain, "gdsp", 4))
 		return GDSP_DOMAIN_ID;
+	else if (!strncmp(domain, "hpass", 5))
+		return HPASS_DOMAIN_ID;
 
 	return -EINVAL;
 }
@@ -2655,8 +2658,9 @@ static int fastrpc_init_reserved_mem(struct fastrpc_channel_ctx *cctx,
 	u64 src_perms;
 	int err;
 
-	/* Only SDSP and ADSP domains use a reserved remote heap region */
-	if (domain_id != SDSP_DOMAIN_ID && domain_id != ADSP_DOMAIN_ID)
+	/* Only SDSP, ADSP and HPASS domains use a reserved remote heap region */
+	if (domain_id != SDSP_DOMAIN_ID && domain_id != ADSP_DOMAIN_ID &&
+	    domain_id != HPASS_DOMAIN_ID)
 		return 0;
 
 	err = of_reserved_mem_region_to_resource(rdev->of_node, 0, &res);
@@ -2670,11 +2674,11 @@ static int fastrpc_init_reserved_mem(struct fastrpc_channel_ctx *cctx,
 	}
 
 	/*
-	 * Audio PD (ADSP) is a static PD: cache the region so its lifetime
-	 * is tied to the rpmsg channel instead of being controlled by
-	 * userspace.
+	 * Audio PD (ADSP/HPASS) is a static PD: cache the region so its
+	 * lifetime is tied to the rpmsg channel instead of being controlled
+	 * by userspace.
 	 */
-	if (domain_id == ADSP_DOMAIN_ID) {
+	if (domain_id == ADSP_DOMAIN_ID || domain_id == HPASS_DOMAIN_ID) {
 		cctx->remote_heap_addr = res.start;
 		cctx->remote_heap_size = resource_size(&res);
 
@@ -2761,6 +2765,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	case ADSP_DOMAIN_ID:
 	case MDSP_DOMAIN_ID:
 	case SDSP_DOMAIN_ID:
+	case HPASS_DOMAIN_ID:
 		/* Unsigned PD offloading is only supported on CDSP and GDSP */
 		data->unsigned_support = false;
 		err = fastrpc_device_register(rdev, data, secure_dsp, domain);

-- 
2.34.1

