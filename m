Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510403;
	b=kIJg+0uLcZd7/E5tcw9vZg9YDeHzieIq9Wugvgg5sPjHEHuREXGtHny/RHAryvetZEeP
	 6UbhP7sOHhn1xak5nwz3x+A6/Oj0WN29J5uo6yfJJa8RN9g/letFWn7NvBDm7ERfvJ1YW
	 R2myocIxZ6viUgRABrxMMixfjt9C0IEWMGBXUNX8K7qEd9d09YGm0heQZU6N5HLE3Knfr
	 MRRNRjbj5OURu5zsiXTW4tuISjLjns9R8aJMNGkpHnai1kPe6ojBDkWf2v4ddk8GJNRjk
	 DW4lDG+V0J6gl2VKhqQ9tww49bT7GFuHpdutlghbZhfPISXOv/YqmmV6te3AXVnYPUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510403;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Rgk6z0ZbGgZGUwPRiIMepzhygLrjToSRy5+RkQrNTkg=;
	b=SCdukyNixBBg62ovrQwUZPJzSB1P6r5OMd0FlByGdfzQIrWwxfp+O+Pn1bqZ5SUy1hhe
	 LgtH4aAPPgAVfRW4//SSItAUbHKenH7yY5mzxVDUqwDVRk1q0rhYv0tb+4NxdCbtmFcRp
	 5CxCPaxRWu8UaiiUboo4Stx7SIOM3MExVQX8zmR0K1yklG/0NKFpCFiHXIWOkP7QgaXmk
	 oRU/OTnBUnEPqhjH9tVX0/dU/1GroNTtSmTPVAPR0YiiOWjF6twQL75FNS/+4TnqbKMxK
	 ON9reoMhzvy+ouzcIZgzgiP1fkx8jY9j6O/mlR765iAN2sMvKEM713dgs2hsUXXC1/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aDkerN3T;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lnsva30w;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BAA606A69F
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86BAA606A69F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aDkerN3T;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lnsva30w
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8ZRJd3850773
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rgk6z0ZbGgZGUwPRiIMepzhygLrjToSRy5+RkQrNTkg=; b=aDkerN3TbfPjXjBs
	ym+aRZ2ea7amf2Go3ROmVp5dfToS3QkquGPKRqXNLaQ1yA+Gq5chlIq2XQY78KbV
	7B4zkMfEWsASMTzmG5E3DxS7PueaQKyxCXiEOW7oUgWmYJi9hfcB8ZW22LXlMZgJ
	P7Bcxzu8cYhNLfShYPvpTXc/l3S4JYyPqO48Rd2j3jQF1NpXhmmrzhTNNzWcqV7m
	aaAzMlDEKWSbgAzwMsRrosGRa3Nzc2BR9hPDDg0BI1iOxIzIZs5j8nreHTPVx+Mx
	A1sa5KOp5J4eLWW3HWqcettQbfRyVv4rOTBYs+xB230xzcpK1VuFMW7rtXFVcE9c
	OcAGDg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvb1s6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:53:21 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375bac6bd21so4774364eec.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 00:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795510400; x=1796115200; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rgk6z0ZbGgZGUwPRiIMepzhygLrjToSRy5+RkQrNTkg=;
        b=Lnsva30wG2iulzCy9ZNlgePzu96AmFbNs9t003s73J5EuSeEuorc+kNLTbx/iEZ76V
         OaTb5HM2pH+wCpmOTqOEbGV3NPO4/yrGBSvGiCLkkrkXKMb/ocj+cxeXfUe4CE6pTS5N
         2d6zfduxbRuZSsaMXkH4OqCRJJi0i5GLpFAAwHDx2MA1te/aPgEJ/rLxd95Vp8UDLtst
         goVOFyez1Wb7yapMR0O8s4vd5hZP8NeH3Jj1U3L2s4Fe9OHeugWcC0AF4BP+UIVrZDHL
         B4HJfO1p6MFq9YtUEvzVxqy+YZoanDAoFdU7lIYn8Of/O2EWRDcLDwrs/mTEAd7GN+2T
         cWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795510400; x=1796115200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rgk6z0ZbGgZGUwPRiIMepzhygLrjToSRy5+RkQrNTkg=;
        b=JldMVgzJSBqOCB0hA1J21MfbPRaq6IgTk4b3NjfKN4GIneNuSuluGDQTeXT2Ei2Ej0
         HV3jfV5OtCVL+g6QFsNAD6o8sAKrEod5sjKN4Bvxq7nh7Jir2EXCnZBHACr4iOUZGz5v
         je9KMO53r0cKqb/Qjl6DcRngVqdX6CzduRj8z1XY1HH5cC4PVSisMf/2vQGdZijjPJaM
         kC0x5dai/ypoulztv/E3IaYjjXVdA7f0HoX9aUj1FFGYXRhW4RHpxiL24DboHLKNqMsv
         Dh9MG14tzEaaqDc5iHHcZf6+wqexG8rCnv2okg+gayUJ54t++yh2k3sC85RYDKT3Xwq3
         WbAQ==
X-Forwarded-Encrypted: i=1; AL+hErFqZ6vHjXDq4Z/hIsQoGMmXQVAiRAAxPJuNZBwoEjgvKVTGFLu+VrB4aJQqFZWPEfgctYFFRXOCrJmv@vger.kernel.org
X-Gm-Message-State: APuU4Z/xdyRF1cW8nBAGDKmYPjCne74qcpgrEpjqJ4cPWfj93dkws88n
	uNyvPLfZk9PLqvs4QbScHFugYSkQFCnm7nPXtLfhPikrGCFKzmGs5eY86aLw8dJl5qYl8DGiG27
	C6JlK5FCnxyFPuYwBZ4xOZSU2Vc5tj6w1/+8Z8aZO3lyE2auU4odkZ0mD78FwcboI
X-Gm-Gg: AZFdTZfuvbcp9LkpG3YHjp4u9xPk8ZId4ve5tEh7sVCF+c9icbdEdu/X7V37KdVeRBi
	9xjX88bOJmav2zio0zsGsKAQI6t0gYSZxFChFY7+dlqWDkyO5m/5zzm7/NnkYhzhF/MegrQrpET
	QjJoE7NFIeose4shPmoNLipkz3QJy/g+ZQhK705MQSKSs/ZzTCsLSFfndU+o8dcEwDQ8x/qzlON
	47tIiU3EP29ROzUWL8K7iSV5ssMN9Uu/YSgRJ6ZPQrs2PWH26RV8hM8Etc5LEIQxrSRpVPOqEzU
	5H9UceyoLvr5/Blp2t1QEuTzwLAzKbVyn8FJVFnELz5I5TTa7n7zpbl4brk0hVI1qE1uyIkpa5F
	l61EnpnN96SXegpjaOCp6EL1KuXnyBzw4nYhyQwVcE1A0DhzTeQuSHpkL0D17qZ8cF+mvxnDlfl
	SsZA==
X-Received: by 2002:a05:7023:a8c:b0:1b5:4d7b:9ea8 with SMTP id a92af1059eb24-1b55692849fmr15110426c88.20.1795510400337;
        Tue, 24 Nov 2026 00:53:20 -0800 (PST)
X-Received: by 2002:a05:7023:a8c:b0:1b5:4d7b:9ea8 with SMTP id a92af1059eb24-1b55692849fmr15110391c88.20.1795510399729;
        Tue, 24 Nov 2026 00:53:19 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm21748199c88.4.2026.11.24.00.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:53:19 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 14:23:06 +0530
Subject: [PATCH v3 2/4] usb: typec: ucsi_ccg: Add cypd6129/cypd6229 OF
 device IDs
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
Message-Id: <20261124-ucsi-ccg-cc-orientation-v3-2-73cd114e5393@oss.qualcomm.com>
References: <20261124-ucsi-ccg-cc-orientation-v3-0-73cd114e5393@oss.qualcomm.com>
In-Reply-To: <20261124-ucsi-ccg-cc-orientation-v3-0-73cd114e5393@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Akash Kumar <akakum@qti.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6b055081 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=nKNncH1Eii2HH4qo_fQA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: ISsorMJzUbTjz600hQtSIxEMVmPb1xfV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzNCBTYWx0ZWRfXyt803AMBsSti
 6S6NE2W3ase6OvNe68ah0XFQQSHwyy6WKMe58J1UFiBZ+ZezNmh+6KbEjg6hSfH3uJiwkf3HRe0
 D8YDRPQpw+eJSC8XaBv6GonAFQ3Dlss=
X-Proofpoint-GUID: ISsorMJzUbTjz600hQtSIxEMVmPb1xfV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzNCBTYWx0ZWRfXzfp/3mtR1CfI
 WogA4muci0PHYPSHONsQockm7jfQKlCLvwwLGIhxyyYIfChow9E3qLmmdGKodCtQ+YCvFhU1jio
 ThyariLheQ0OYbJjiyxj7PGhPx+h+jm995P/i/KlxPOaRVrbA9IFyXQx8fsi2wz9VWS4XsD5za7
 YvrTkwibB/1BhGOx7hla9gX5xXxBultefX97Pv5cH7TEt757J0V1fzkJCuixZ7lst+HHFlAFJXC
 9D2HKlr+8kSJ6A4MmhiBjf/duhWREBVqii1mqDCM+IFmD0u8vIpfhREihLRcEUPQDqfwSghvTyI
 FvbnXcB6hjcx8uS+uWmV53G0lPWUBWWaRZOx7JH0dJbHfIIc5SKFM6RCtB5QYjtl5Pf8m7mZBQ0
 szSXe52U268zo5rcvlAlr5+CE2XHsD4QQYIYxuEH7Oh+YLLsEaCLi9uoeAEzdfjX/Ycr79y7ve/
 F3PURSrrdMaTnEHNvUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240034

From: Akash Kumar <akakum@qti.qualcomm.com>

Add compatible strings for the Cypress cypd6129 and cypd6229 dual
Type-C PD controllers to the of_device_id match table, matching the
corresponding dt-bindings update.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 96d0557a862d..c560d4539302 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -1556,6 +1556,8 @@ static void ucsi_ccg_remove(struct i2c_client *client)
 
 static const struct of_device_id ucsi_ccg_of_match_table[] = {
 		{ .compatible = "cypress,cypd4226", },
+		{ .compatible = "cypress,cypd6129", },
+		{ .compatible = "cypress,cypd6229", },
 		{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ucsi_ccg_of_match_table);

-- 
2.43.0

