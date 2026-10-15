Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC294EF15E
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055747; cv=none; b=Q3ZkCR380rxWx5mXm0M09Lj1oz+ycgSU4Mmkahudl3SJjrrxCxgnGyHk0HlMetdJgvy4VpfentDeNB89jsSYnYHQpvzsQcBM7+Rqw4K1gR+D5H0vWYeh8CRsHUeBYGbzQcIweNLaTifLi4WdagJTrCNMxYMD3l+70Gj8ZMn6Odg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055747; c=relaxed/simple;
	bh=GpdtqPuhIHgUo+XsjT0LPFpiwfUdMzHGUCn5RPhFeME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mvwpwhIA1Y/jQ3kuhqzwIprhI4KZX75IM2w36FkrhgqwNT2sYyn7eJtnJVPTJK3rb3XwEPv2iMWR7hkofdp0f6BiW/93ZviA2NOzMcaRe8OvgCVnvHHiLrbdVcCnNroB/s1YPhjOTE6AuH4yxv/pg+7h7uJnCYLAGC8Wb9Kkx68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OrxZav4m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hqFHrJuJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OrxZav4m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hqFHrJuJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3xmSS2739406
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:15:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vGMnYlGXQieTtFbTjiko9Pi+37ioxPIws0R6S3kuKys=; b=OrxZav4mWEwsbSN9
	rGHR1DdvgyAxQwLgkCOyuBYejz1BpeKy46R8Wo6x83XGNX4Ud4TLeBx9G5lYepMZ
	XkddneI1OhLOqCLimpJtcIB8hd/kNXwAKHZ+lCuyHniwCW78D9EuQbQ0To8cA69p
	LfWbBZhS8ps/vMSoQIpLN+NpvH3xOlDYWDRlxvqs0yvDAHJWhF8I33eITGShVmwi
	pqIHt9UmMTXPsqKU1MiWn5eLyVAklvC+L3rD3IFUiR9sQJ+xyT4W2bIOzDSDvw6p
	v3XU0UCNKg9oCgtk3rlWYrxoSwD1uqDkdIRZ/TN/FvfU8JJuElNUDSQLDkiDLCEe
	4yRjOA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqds977k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:15:45 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-154e9d2d94fso1348780c88.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055744; x=1792660544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vGMnYlGXQieTtFbTjiko9Pi+37ioxPIws0R6S3kuKys=;
        b=hqFHrJuJRPA2wfyeqMo6kahYwV/MhjPTckrFXYBYbx2OWP8kem9KzXZZAw18arfGiE
         QwzwDFSv5Yxk4rspS9YNqbqNRyY47y4lEu6h5/M38zIVX5sR7LeKDJva8pK5NR0iy8eC
         nMqIeLHJGW11qXoUieQC7Wdzf5Es6dTfBBchOCpXXVSUnb8wykHTTjCii5yu2lRNJ+6I
         a7Gks4XGO8F4xRGXIMQCD6X1KVGgJPlSKPCfz48XUyDBrX02ZOSrH2cBvk6rRcUAsJXN
         mjWlxysMmeU//SmJ744wi5m5kc5JvbQ4kAUq8mTFB8xkzQFW9/3r+gaeiea2TjV4i4HH
         Eszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055744; x=1792660544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vGMnYlGXQieTtFbTjiko9Pi+37ioxPIws0R6S3kuKys=;
        b=L6veuFzsfM3elWsRZ4CJVnxTL4mN5e+2sXZOhYuEZ5/dtutEFEgYMlcHgjZAXXAcDD
         d2mOVeX7TmpibU0kPw6GdJx9POO6jrdW6yDbYer5pdU5jIvFFYTcWuGYpLwlAftGvF//
         pmWC8cUkeSdw1m13418OrHTkOSJsrk8dWPRrm7Q+UxWQwpgpAkMfMBgB3DkjFmdwYGoa
         utjNsY8Rx7Ry1unbd9oryBKvmjmslaY6ogCnvFk7CaU1uaOaIZtCPWorrXao2W153oC2
         rEGk7bzm89tDoMbrFi5xlQP7itf588o8hFwHaSgBQ5Hi/+xrAMfOdy9feKVttkNk+UAi
         DOCg==
X-Forwarded-Encrypted: i=1; AKwUvBzhA+W8G94hHIg4mexCcVpFnBVBK2Imx0G297SbpdL1n9OXjdrQoWhQ9H2xxIJu5fcymlFZC6/IH56S@vger.kernel.org
X-Gm-Message-State: AFq9FYIgoOQKUeAe6PA51fz+KW3c+fFc/01Mp9hX6PS3Ozmo6n2k/sga
	pYCM8OuWuxNV4xvMbC+XRypdZVQ3DhYQ36NDHmDLojTeYfrAPFAYXZQTcZjTuwASe2W/BKTPpRT
	OnB6ryj9i3ZwmLXqMoxHg3Qd9NZ6nBrSeQLyGvStS0NBV9z0WXV+AVkXjQraQ9xms
X-Gm-Gg: AYBFou3KqswYxue6VznuA4yCin2AvL1YXx/saZiENBWPtcrWgrJ8bZuhOdTHBV7V7Sj
	GBLdeQ+9oDZ/iNhseaxkoerDkj9W1z9WeJs+oPHuKbQiZ+73HMoOOFiMhVCt16ETrcYEJNqYRN1
	ORUHfuasdB1Bjb9kTPeGsRJZrgtOfj90VTO1N/Qbe0YiY3kz8Ly/q0iOk+QwW4F/ByYQU4rmsPg
	IoXZMpitSarKnntGAnwK37bGi/DWbwKPrqHZVRg+gi0VsTzKjTH3yEmuktuaDyush3KVhe1o6aU
	odKUJ4dpU/St0qZWl3S4w7NUaGQd80zG+MyawEv06LxullbTrm4elD1W833Qg3V9deKtVSZSi3F
	kDnIL7zIojLiogOsV5lArr85LOQ==
X-Received: by 2002:a05:7023:a4d:20b0:14e:906f:9c8e with SMTP id a92af1059eb24-16a5ed3df0emr24935852c88.20.1792055744125;
        Thu, 15 Oct 2026 02:15:44 -0700 (PDT)
X-Received: by 2002:a05:7023:a4d:20b0:14e:906f:9c8e with SMTP id a92af1059eb24-16a5ed3df0emr24935824c88.20.1792055743537;
        Thu, 15 Oct 2026 02:15:43 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-17dc865cbffsm19671658c88.6.2026.10.15.02.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:15:43 -0700 (PDT)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 14:45:29 +0530
Subject: [PATCH v5 2/2] arm64: defconfig: Enable LT9611C bridge driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-shikra-work-v5-2-5e075222b60a@oss.qualcomm.com>
References: <20261015-shikra-work-v5-0-5e075222b60a@oss.qualcomm.com>
In-Reply-To: <20261015-shikra-work-v5-0-5e075222b60a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792055731; l=859;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=GpdtqPuhIHgUo+XsjT0LPFpiwfUdMzHGUCn5RPhFeME=;
 b=14xHplB1bkeMuVzWZkw3U6O39JcudkxNuOezD3gXZhUH1cfQgYhKUCf7g70C1Jor5vnZMd4ua
 O2SZU3p1zdsBOeW3eHv5zhfhZP5ZAKHgiyGMYbWCdu4LKV2ex6pHORO
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-ORIG-GUID: -HBONKRmDGSMRovdvatyEWLbY7csXfu9
X-Authority-Analysis: v=2.4 cv=fNusTpae c=1 sm=1 tr=0 ts=6ad099c1 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=TdSgRHaedGDaTSzhpQ4A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfXzLQmTHxyQmz7
 ZWEf/XgYV12i65lhEvZ5fMtHgX8kxYpytDbg0oKJ7K2kOXnM34TzW9P0R9whzhvZv+UHPx8kxco
 m44ASdD1ImoEeQoyhhlbmOGGH6EuidYtsvOeeSvQqw43AGN530PCQAoFhqcOVPKLmS/OAcIsneh
 GnYr0ZOTNreLDalRKWAgZSeXGU/Mp49fz4UO3Vhdf5n9PfUlnMajUYU1qjv7lvz/pLq8DzbgU8/
 N9d5XshKZy81Ed235q5LRuS8neN2N4KdtWWOw9ta9aKx2h66Y+1L3urtftcU1Upocmafk/Yqsye
 ryZPeiy/6DdiNM0Ml9ctc+PFrdI0Mbh6Gzdwn3gplNh9MzdXEM2N4jgRwNu/4E6fagTnpLlIbQg
 zIfj2lt3V7vfM5ykS7KJ4KcD5V9YEDHgHnzsh0F/ylpRGvg99w06jyyfnPpwad5W+H2yqDjhQ7H
 bIorMnPdSsJntqdKP0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX/4IZQ7f/QWj5
 do7nhpO3FdBBth5BRoMDN4hYoMKgQksRRjHmdJfo+BvpHEWxriQnGpDhGMnRkdfzs+oL5s8MA3N
 MP73aDwQ1Ni/1kCIdOXy6eO4YROAJ+U=
X-Proofpoint-GUID: -HBONKRmDGSMRovdvatyEWLbY7csXfu9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150036

Enable the Lontium LT9611C(EX/UXD) DSI-to-HDMI bridge driver as a
module. The LT9611C family supports single or dual MIPI DSI input and
outputs HDMI, and is used on multiple ARM64 platforms.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 65fcbbfc1601..d18f72e55330 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -977,6 +977,7 @@ CONFIG_DRM_I2C_NXP_TDA998X=m
 CONFIG_DRM_ITE_IT6263=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
+CONFIG_DRM_LONTIUM_LT9611C=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m
 CONFIG_DRM_LONTIUM_LT8713SX=m
 CONFIG_DRM_ITE_IT66121=m

-- 
2.34.1

