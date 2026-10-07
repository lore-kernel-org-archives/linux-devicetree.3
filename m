Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6962647F2EB
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 09:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363799; cv=none; b=iiJvijhlnigunDqhg8FZHZ0bCPuSXTQ8tdQutltlgQXbg2HKlV6nPwD6zc8EyNPp1PwFXOLy1kZ9cOpDMyq0E14W3BGNCtKItKTcopjLMVJNCxrZ3hOr14TS+WV3lJbKLYQo4Z0KXr+7V/dg9JJ/a36G49Njrw17bniFVG+HGKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363799; c=relaxed/simple;
	bh=6Y6z1JDeisJ2Nl0/RT2ILCUl8kE590RGswDtsPSxnfQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fJyM4Xg9CUEGtvnKpzwXhrnSZyn53Sr7C+xN0WPM+Rjbmahin/EyoScpPOuMvzOWsZNuJdLzylMH27zDnOmQ3CWi7S7CayCqv3tkXUBEVeUVvxUjT4LRHQ5QUD1t/Lea1OSVJ7fY3E8SElLs2Er/cW2I9igZiajN8CSt0sqM+hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sn0+CLcJ reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sn0+CLcJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jV2K118873
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 09:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1Wprkf4GoAH
	etdPZnQoqyiufpWRYQl51t90Ivzv6Nlo=; b=Sn0+CLcJ12M7Ims03pjAQzMxsY/
	7Xe4uhqTKxDUmYnz6Zu5h8xzk+aSRFbCLeCEFEgEqeuNZiuMy53HiEFmA80ZmOOy
	UuDL5O3+xElLrTU6CP68TV2cwybIJoHNGCztKMXPhFoSOXVUxbTRN+oiGbcYursI
	hZWifqjsflYi0RxzzTvFcP9rRBng8VIpemZUlVYodKGHCXCr6mq1/96gj4t7qzUm
	8rS7z/eZBfIQdXxxw2VG/uTVwfgyv1hn8UeOdDNAw3nrDDl7ZatSzR6UqAnRO23K
	SJDKj2l0iVF2rRhIF3yLZonEz2I8YoymhRiWzY7VI7/OMI9Jj2zCJEThs2w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fc58r4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 09:02:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ae8e7e546so726638585a.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 02:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363725; x=1791968525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Wprkf4GoAHetdPZnQoqyiufpWRYQl51t90Ivzv6Nlo=;
        b=XfdV3BKHbIXSYA+JNwE7gNDi49eMgVd7o8wPGRG4VYQGB8HcbzvEhINEYT/xWdGO82
         AfdcUDyYxy7nG+68j9rFD/RrDGm8KsY4BTSZWU5y2yF9y/IgFaiXnAv8MGdhdxhK0i8K
         0xO6PKPei74VdD1d/Bfmfcw6vu/fwdLJXt3wRd7Xoy6mlDAv/tGSorvthquLtbYZzZsv
         Ik/EXPVtCyeNOKYpN/7q6bXtRm6NpGAPVhj/g+d22gREee4O+pF4SVcryNTW48XVxLbt
         Y7QoJqlhrcKCcIltNxXhcDJs78W8WnZgS90HilksQz5Ilq35OBGHQPrvEpDsTVZdOMW3
         UV+A==
X-Forwarded-Encrypted: i=1; AKwUvBx1aV/wTAuQN1SJDTmvu5VARcRcYaTnpL2PBNd+UBORq+zqRkmAC59FiM70Ow285NtbC+FV3gEetUZy@vger.kernel.org
X-Gm-Message-State: AFuF++lSPeAcPk2JmpzRva8tXdqrjPz+qoa5EcHhS6dc3AwOGvwBA5DI
	3khFlv2YDHMA8O+F6B1IWshTVtlMOaAs7KdO8X5SvODma8mq7RM7EDVcCLQZvB25pdnZlQWOsuy
	32AA6V9JMKzTvM4hfkddZEVMYw+s9g+yXjNfzxG1lKUsUoGy5xhd4O2QgbBN4Taor
X-Gm-Gg: AYBFou1F34GgIMNVNGZ4uff/hunjlj1AcoEUcq6U+XZo5LJctiz1mBOeJygKmVqisXc
	+J5OFxfN7Kcf8mbjKM+TuotcdoyW8++TZK7EjCQuNWlz7VN+Xmgg46mBumUDWc4yurPaTUZlP0P
	WsR801dNfUlqaJ8DOr9pjFOgKQReWjTpGBtoD1zJM/pV1fxQbolzaT2Lpp2jn5iSqZKFZkYQBC+
	STel2WcxMN7IUDa1aWGds927hZ0iepDKBSnwFP+RsHvdjmCbNCUd2fQgabxP7rVJzBsxH+wlneC
	KisWW0BTjFZXwEgMRO9CBSSgSZqt78p7d6NiuKq3Wif+AHxU4jz4N4z8ads=
X-Received: by 2002:a05:620a:8807:b0:93e:458b:6f2b with SMTP id af79cd13be357-93e9b6ff7bfmr284554685a.29.1791363725253;
        Wed, 07 Oct 2026 02:02:05 -0700 (PDT)
X-Received: by 2002:a05:620a:8807:b0:93e:458b:6f2b with SMTP id af79cd13be357-93e9b6ff7bfmr284548885a.29.1791363724650;
        Wed, 07 Oct 2026 02:02:04 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:02:03 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 22/45] media: v4l2: add Qualcomm IFE parameters format
Date: Wed,  7 Oct 2026 12:00:18 +0300
Message-Id: <20261007090041.3732717-23-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX9RAqkd/GhQ7C
 y/9jOGWxTBbuqWHgSH+kYnrA4sn5wmJESmLqQtiHl7hzKbTt7IhWemMRwqHXWMxALizMUsPy1Ke
 MIcXh1OoKXfqcHdoFXSDfeR8A+BJpFw=
X-Proofpoint-GUID: ofuDloprVnkgbGPF5_T548weUYuqfZxu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfXy08+3pjL4i29
 IVtApVx06obOTlqakBnir0YYDZLLMA24SYsEF4edXISosGG5AVcMrZvIZX3FWi7G9afZ0b8lGpf
 bqLTIrLOXsSFwjVMjFIN3FjwQU1yEQLAscxmdUtoFB1KBWMqsnMtQlKtJgMPrstQu3pzmxpp2Ic
 HglEWRBxosAfdvSiJRR6mJpwbysr0GcEHfhjt4GNVwcWpKd6ffYsCkQyKf/EQ2cU7r0V+BD6HAi
 2LQCcJrxOI+wG2PlWPCSMNnEEruM0Z1dOQRZqfPYh7n9cODDBN4eZypehnIDWkWsX815pWl0WBt
 Gbjqg//8SpavqJTrLwBN/IpRbwVJI3k+ynQ2MgtSC8Hfy4PmAJ6TMEfM9o+MGqSqzFoE05ywf3v
 C0t1+DHmxy+fkscwPBGIqbIl1qT4YLyH3O0fuaSBO1dgQkbhAdxHCbA4JBazEBk9Fpj32f7+/If
 y9t4odRpttnnLb1UQOA==
X-Proofpoint-ORIG-GUID: ofuDloprVnkgbGPF5_T548weUYuqfZxu
X-Authority-Analysis: v=2.4 cv=a6+lZkSF c=1 sm=1 tr=0 ts=6ac60a8e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=1ys7_V7Nn-5Y8TJEc3AA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Describe Qualcomm IFE parameter buffers with the QCF0 metadata format.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 3 +++
 include/uapi/linux/videodev2.h       | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index b7173a258225..581ed9d74b82 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1470,6 +1470,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_QC_IFE_STAT_3A:
 		descr = "Qualcomm IFE 3A Statistics";
 		break;
+	case V4L2_META_FMT_QC_IFE_PARAMS:
+		descr = "Qualcomm IFE Parameters";
+		break;
 	case V4L2_META_FMT_C3ISP_PARAMS:	descr = "Amlogic C3 ISP Parameters"; break;
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 4a0748b60a15..52ad260e65c8 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -878,6 +878,7 @@ struct v4l2_pix_format {
 
 /* Vendor specific - used for Qualcomm IFE camera sub-system */
 #define V4L2_META_FMT_QC_IFE_STAT_3A	v4l2_fourcc('Q', 'C', 'F', '1') /* IFE 3A Statistics */
+#define V4L2_META_FMT_QC_IFE_PARAMS	v4l2_fourcc('Q', 'C', 'F', '0') /* IFE 3A Parameters */
 
 /* Vendor specific - used for C3_ISP */
 #define V4L2_META_FMT_C3ISP_PARAMS	v4l2_fourcc('C', '3', 'P', 'M') /* Amlogic C3 ISP Parameters */
-- 
2.34.1

