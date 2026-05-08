Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6947333BBAF
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 08:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778229410; cv=none; b=IV8tzYuyF7JMTBxNM4F2/FygDLohZ4DTt3YkCvCp6yfN74c7eOzJYRA+tqwn7DrwltAckE/ejY1mSzrsoBRvDPi5FSh9zsjgm03w3SGPNK+FYVwKdDHZiEUq85r5fuQNHmrnmV+O+VnRiM8haG//SohvFthDdY+x0k/JrDzoETM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778229410; c=relaxed/simple;
	bh=DAppTPvLucR7IEtw9g/q6YLSFy9LNvl6CQ5HmqEGluE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oZ1QjLgmRNLPkZm//cIjeXLyjYVLohApgawyzpu5FpxYjf4QunfIAUnAZJGnNvLpMEcvsmP2UZ65QrtndXWdEZaWFGMpNWQt+wAE66fqRUhC2O5kriA0c/YdIoa5qpaqcprvabn4jGRqr+1AR5ywzufQimfa72HD4/Isg+p7Nls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CoOE0DA+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BH1ixk0m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CoOE0DA+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BH1ixk0m"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6484fIgC1417594
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 08:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lMgaUn1GgK38PmfYxorJOo
	o0mS9UvteQnNYm+tOg9uU=; b=CoOE0DA+gIX7Pe0tm0XKberbEVDx5duyg1HgLh
	k4P6AZUv3jW50D4+nkvmp+dIXLHxKRbWLKTCpbATythPKkp/M3SOMkS6nZg1j2P1
	r8XCym8wYSSo2okRCKK3hgWFQs2hnojsFyOnSsJniAA+OXZP5MMNhAHWCZdzUbVW
	cR3ODZVxKEUrEzSHoVKohzRvEugrEPj6Pqu/RxkX6DUqfjl4p0I6RNLEImKzxH5L
	kJMHgJ6vXnis/3YZd5oOX4FPlYe8BYz+aX0fCMRmo4BGNrGZoTKkfDnuqRBJ25WG
	ZvAsf+42R0e6eMPKeePnW+U6na5jVyZArMKmn+MC8fhTzR4A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0ywhjqa2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 08:36:48 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bda35eab74so1432454eec.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 01:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778229408; x=1778834208; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lMgaUn1GgK38PmfYxorJOoo0mS9UvteQnNYm+tOg9uU=;
        b=BH1ixk0mx6fVBeukOGwUYUvtBle79Os1P/BCGfi3LxSTjivHGxVqWQjk3/cZakQEmS
         iQb/MbWthAXYpyNtpoTr3nQoZUhwFH+E2F//F5u1iFyDltVk9wp1m+cLODjBwmAjT85H
         q8QLI+5xZc3/6+DV8zusn6xlNwH81Sgu5lttIhpRUuvv4J1wo+0IGV3Ddr4tLhY+rbyI
         Y7/7xX/SRziLXdvSjOngu0O3wND3HswrwjBgPOK902OdeyOYmjC2CIHx4Q9jtT8qJ6Db
         6dJX3+cT6cmDkQdNdkEv9wJfKqoGZJtvtuWAHxDlyUukiNMQ9CQUvMKTGTQxAaVBf6/E
         4OTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778229408; x=1778834208;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMgaUn1GgK38PmfYxorJOoo0mS9UvteQnNYm+tOg9uU=;
        b=SF2w2aJCXFXN/dGXCbmdRkSrsCVCSOyziOTqY9ikMVbH0ntUTny9Oir03+uiMqsggC
         3/coLko9LG5zavt5BNUmHZvBLNXMplNc3OjamIoiJh/DKBqSSxdkRXivF/MAMMwV4YSc
         DjvB1IdGDig1rJAxI3oJ0rkIpXfbSVzGarpu9vZZNCyREvJ5E8l9V0APToaycLMvvICo
         5UAaimQX80VhGnutxTEUby8WEb2ciyCOB/saeEiQHoxVCdAhIE7nn56GLl4GszO/Gw9H
         lgdFHxmgHd0GglMZBYqMkv9Goo5QEIirukxSAicmC2HiHXF2p1DIhnIcCW/LeNlYkajE
         zJHQ==
X-Forwarded-Encrypted: i=1; AFNElJ+obbj+kz5OYo0K7/KE1jF6KOydSXTItNPm+vstOivAF6RvNtfZOxVNK52p+6tzdtkQy/N6Hi+E0pvj@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9jLKFlTpNXWmPnrTWjmfW6dBi2FTA8wCTsyjr429rohylKCQD
	SLum3j4aZ3whBl9o/DBoanz61NY7OHpjWUo5705l3OP7TsxOLFVibNSidNewU5Gvz65Jah1birt
	oG08B+qLRcw9EH97BAlR7cb4QpApPFIzhYIXZoydYjXRojDedIJRRy2wq9/F+9lnq
X-Gm-Gg: Acq92OHsaDEHgSjV2XRz1iiwvd6uvt4f6C+ucEPToVdGd0jR4jvjMVsQRLwYN+RovMT
	CXUchaB3nAtBuOy8oouDFmHN/howS4p9sI2CQjrpSunLQGX6G99wkVMMjARj+3iaDagCSRtoOCt
	OBA2qFIdOIBBM1pv4hLl5GaF0/V8zYfxkiNpnbI890Wili4qKdTDgwUoupvvX/f7FNATfJdN71n
	SKdYVrBe5hufg2ZwlFffUU/arZ4LNuNBP3W4cugktdSGz/AbJl4bT+PbJVt6PK7igvmCO6ib413
	PujkDRxGZMdHfKuos0b1n0pSDn5hgy6xldiBmxL3Yd0xYCbAKzxIVazeTIqpRTE7dbifyl8A8Jw
	YubKRsDPbb7HDGyPA3Fm9KvOtSAnOftaIJcjurhTIOcJS/8kUB6cmpRgC48R7vF4MVhsETXr7nJ
	dFvSjsAZuoHD8=
X-Received: by 2002:a05:7301:1006:b0:2be:17b1:e49f with SMTP id 5a478bee46e88-2f6e1e316demr2668502eec.4.1778229407889;
        Fri, 08 May 2026 01:36:47 -0700 (PDT)
X-Received: by 2002:a05:7301:1006:b0:2be:17b1:e49f with SMTP id 5a478bee46e88-2f6e1e316demr2668485eec.4.1778229407292;
        Fri, 08 May 2026 01:36:47 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888c3b301sm1504922eec.23.2026.05.08.01.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 01:36:47 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH 0/3] Add CCI and CAMSS support for Kaanapali
Date: Fri, 08 May 2026 01:36:44 -0700
Message-Id: <20260508-knp-camera-v1-0-a18e289163fd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJyg/WkC/zXM0QrCMAyF4VcpuTYQC3WwV5FdxC5qkHYz7WQw9
 u4Wh5f/gfNtUMRUCvRuA5OPFp1yi/PJQXxyfgjq2Bo8+QsF6vCVZ4ycxBiZOhopSAzBQzvMJnd
 df9h1ONrkvTSzHiPcuAjGKSWtvcuyVvy7MOz7F1moeQ2NAAAA
X-Change-ID: 20260507-knp-camera-a070d05ec552
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=bMAm5v+Z c=1 sm=1 tr=0 ts=69fda0a0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OFdHJre5LK366wQswZQA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: pbcNhMrDD5qffZM6NZMdXlIu6wbLqbnu
X-Proofpoint-ORIG-GUID: pbcNhMrDD5qffZM6NZMdXlIu6wbLqbnu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA4NyBTYWx0ZWRfX4bf13dHu3wAh
 ObXCtXgx4k0ktyVK/pNKFFVsC7tlX+fAzPM2weq8EFYH54S/iFyuwaFcS9VDqJLUYXsW3MbPB7G
 4+cFkzYlDTu5+9bajniWkmlHLvNJsf7QYPKqLatQdhN4nkqQQt1f2sWFb+drOO4Lldqnr7AxE/2
 z9MAZpVAmOAYOmmccsZp7sLBzCh+z3zwCK00ALD0bEj1GAo+AZg0n23iqu64GeCpXSTO7MPV2LG
 TgVxiN00YSZo/GwpLiX2wwysBLlylqs6fKqxy09cQywl+P2bvru/1aj7w7H5g1U+OQnMRUegsjg
 xmmMe2RAOuXTp/CN8Jj5WkoECWECizt0vnE8i6qyNAdfllG1ldEpVpLg22NSfwklgf3cRxdWHM5
 6joLTi+lUGyuXXMXf3uGf4DljgvwmJAgyqtcen8j8e/DbN2k65thT+44CxShIcU4u5strmyEUTl
 sIIvn+OmKZ0iN2fuW7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080087

This series adds CCI and CAMSS support for Qualcomm Kaanapali SoC.

This series has been tested using the following commands with a downstream
driver for S5KJN5 sensor.
- media-ctl --reset
- media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0

Driver and dt-binding are waiting to be merged:
https://lore.kernel.org/all/20260508-kaanapali-camss-v13-0-2541d8e55651@oss.qualcomm.com/

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
Hangxiang Ma (3):
      arm64: dts: qcom: kaanapali: Add camss node
      arm64: dts: qcom: kaanapali: Add CCI definitions
      arm64: dts: qcom: kaanapali: Add camera MCLK pinctrl

 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 539 ++++++++++++++++++++++++++++++++
 1 file changed, 539 insertions(+)
---
base-commit: b25f15a8600145233c948b40cab6d7d57bac3076
change-id: 20260507-knp-camera-a070d05ec552

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

