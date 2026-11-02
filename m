Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618268;
	b=P8iacdzsSYRSZ1sLJYRrUzg8x+DbQaBhB+myLcfNUPZyGuoMO1irbHdHD38AHBkpwZjm
	 W+HIfyg2G6nj/kHVnv1v3VipQIJy0Czun5ieL0LLjuAbaBkdWJQG4lQgBQpFMiHYUX2od
	 I5Y5yC+JBctJW2sCb0c3dw/LFFBZr/Yg8PQQ3/boIN5AICgRwRmynEERafBwgu66XTcfG
	 Ak28txHymf2I4OST08932rjybxn1XGQ2/v58fcCgnt8wbHQHLWFzym0GCWR8EyRui/RpE
	 +Fqu8S76Oy+yyU04YGoi8d0ZC90vu5IZnpjEZFe9VQMH8cjh4Cksjz4y+iAb97zM46g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618268;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pAwUqom02A0DTMlHkITyukQZFvpQ9lTes96etKRTtbQ=;
	b=07vM3ms7TkeUH2JgR9kYIid+FzJkPt1hcjHcfrBv23fxRJgzboRm0XmCAiYDnrrEyfFG
	 aiZyzFODOBT+zm65VPo46NocjSOXtskynimHRiTMljlkLDsNibaw/CK3Wf7W4wFBKkWx5
	 Ihyfj7h0ruF2dXuFHOkzYhgSYxImSSs/9eNGsSZZkPoouUPA8vO2r6fuMzZuJeGaAVsiw
	 ZVu3bZcTdw94q+bwtErLOBxvREMs9cbxh0IueuMxiHtY/oHpnYxpKd9Yjb4fL9aQbUTRE
	 TmBJmiY42xseZ+Lc9OQid42qnt2SkJ7mMtmZscQCcmOzFN8/deBl2/tFONhu5SX9UeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bcD33cvo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HhkeCBte;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F50606A32F
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 11:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23F50606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bcD33cvo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HhkeCBte
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A7C2214017
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 11:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pAwUqom02A0DTMlHkITyukQZFvpQ9lTes96
	etKRTtbQ=; b=bcD33cvokbebHC038E1MjpApESiL9JijynWqJpQhJSje1qkHHtz
	oEfv8Bftbbqu31bs2g36sMjRr9BLNoSfQxAtvek8YbXFn4XQDVkspjO0+VvBpBcp
	WL0UdgEP6aBqXRTycX1SYbj4NOkwDzqfSpKywJhs4goLJu/XJHbHVDtQPdSJVPAZ
	X+gd3qFxqwQgi0RRw4WUGe4fuMlUSJvnHcat8V0Npd/Sd4Nd2caM2XEx8gkniZyp
	4JjzwAXR/CAfcojJcgIdLifjXaNcK8yNVfVKBxF5j2m50xQ5+Ms647JLiFbIw6Bb
	KMZfNPqm3nEhf6VMSUIfojsboH5EWxBv/GA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1sar8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 11:17:47 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35cbea41088so4158126eec.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 03:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793618267; x=1794223067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pAwUqom02A0DTMlHkITyukQZFvpQ9lTes96etKRTtbQ=;
        b=HhkeCBten0JAY4UYxT088DhUsXuzswkqbsJYabQodzxtY0DaFrSb26NGpLEdVRyxlP
         Ht+YrCxhZAEduEMW8ms5W11xcYY6H97EO6t92HDGRF+hdNQ3EG41GZKAUa8MaPczQYGx
         dU4Wgcdoh1OmPSLzoptQCmXK8dgMKG3rSIKqcgSluau2pmnoMXnY3NXZHSRj/7fr2Rxe
         GrEK2OCyUcODkcUTpNgdcW7BeUHOqdarYh4FLy3lyCIeREvQbLjX22134E9JN/zICCSw
         MJ9LNgxv7KBO74bRMD7Y0Uvwx6Bgcu8pGIDmnZiZbKN7tuG+vb4Sf+cRlIWEiYhVKlCk
         lcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618267; x=1794223067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pAwUqom02A0DTMlHkITyukQZFvpQ9lTes96etKRTtbQ=;
        b=cyyezwT1yfSwg7fAGFJqM8olD6fwlajF95Uyoc7QddAtbkLMWi0g1yz9a9KNM+miVD
         Pt46aqUC1HNCKSiFlhwBusN8ovAymJLQygVZxIXpHLdfxdujZz5CJdjhpgzpVVDn8xi3
         x2ifiRBuXdRkA0wt7ZH0sttpHLULbjDBjZl3CobpJzMQwdulPxzlbqXjzTFeK0kd6+hB
         3u+DW+07R0wrKfUH6ByWMQm0NgMWzc1OAA6Ow66aeiOY5siZHqLYyiVAwfe6ZnF49QnW
         5CBhAIvSJnPRIdTyMv0Ptmq27++yd+F6Pix7AEKOgvSn6RK6xBILCJs+jV7xiJkmddE6
         JrvA==
X-Forwarded-Encrypted: i=1; AKwUvBytp/fJB1+BYQiiy7akMe0vK0y+NlrrKigvTbWusMNTHW17XkRvnwbomE31WryyzVi3nKW4QnZ+kngM@vger.kernel.org
X-Gm-Message-State: APuU4Z/WcX9NytaryUlTh4bOTSDz4zTeQwlvCK6oKBSwH0iM7/AOPZGk
	rBEYRvO/65I6GzhnKPjdeI6YK3YDtX0zJX6kfmlOMHUBoU/0xy/Yi9ngNPm3aQebDTG0DklJOvi
	9XyJ+WEMNZh6lkfMrQ7aSsoBzHAy83ZS41WonW73c4lWJ6xNrB5YDsYcNTvIASdmE
X-Gm-Gg: AYBFou18B5juTrEoi5YSFZcwjUJewWVLKuQqh8NwyPfJjcVvk0VeWT7TDqbz40RaDfH
	rrVlGzrByKFV4ELC6P69u9j2NrdrAN+kEKtK5KBNZsg/hYbNHaDGJMf+yyiZ5u8uoffSzpIsjZW
	YDnudxTQFS2Z3OsOnZRtb4j+UYS25N/4nCOlx6DQAwrVdO5qJuzOGYMcBbjAJ/eS3hdaguoz1GC
	G1SDdSwtZASD3dO85JMf5pYInMB99HHcxjNhkDc/myxKb0lQXY/shNz2/ZVxIIopPf5mI8Pc8O2
	kWHA2VvOPJ7U+0CLvSwSgCqmoNBz+DPORepy/wCBnGSU7I1IChFYbKQR4HEw+prJDgAsheDvb64
	wEJAh8XcC3NxvVcsPtjACRX8h9Zv5VOdrPXOov13bRpB0UuF7bJbqFygsdq6Ik7sU7zcC6aWvxt
	0WZHvb/TkNbRn5NlvFLe8Mo4RRjNtY1Oj/
X-Received: by 2002:a05:693c:88cb:20b0:36a:1e50:e45 with SMTP id 5a478bee46e88-36a423624d5mr14292667eec.9.1793618266480;
        Mon, 02 Nov 2026 03:17:46 -0800 (PST)
X-Received: by 2002:a05:693c:88cb:20b0:36a:1e50:e45 with SMTP id 5a478bee46e88-36a423624d5mr14292638eec.9.1793618265943;
        Mon, 02 Nov 2026 03:17:45 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a5eee0f20sm16492078eec.17.2026.11.02.03.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:17:44 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v4 0/2] usb: typec: Add onsemi FUSB15201 support
Date: Mon,  2 Nov 2026 19:17:29 +0800
Message-ID: <20261102111732.1678646-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: EKuKrHzcddvccsao0E1JpxhZTsk1sUTl
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae8715b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=R9LytnawintqPorzxAkA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfX+Sl/Jrby51cu
 BRIA/s9NqhouV3ZlEdHsOTtx8X+PvFqiA3RcTYDwUcnZIUnFhjC2p/EQ4oeOuaPvyHQh+Ze1DaO
 O7iNuPlLcofeTgptxbDUdyIp49RFH0LAj9izzuD24UUYJSPIdeifkTBfSF5P7Rsb21P29iZraTL
 CdWdXiBqJ+hEEzAIal0jOr0RxSXaJ3UkfAqTXVrGp1l7DEJjF96jo/mCZ1OQqUlrf0TOkDI915a
 kH70fGHTw5vYtpCmPof4/J+xY4q3Ya/9t+rs5ubvrum6HZtHMJv/rAgzbIj+HhUvo9fEVgQZMJK
 mfEb8R3WERV+WkCR4dHz9HIyTu4mMiw66qf1kplWhBV3T8YVh3IRWAUvpbNRVyAw80S2HwVjERK
 +QBF1p+Dg9F1e0eG8x1VhCABeTKo3SX3QZJiXSLNuklfgqX95Mz1v8eWDOGaTF2I5rghHlphocz
 7OQETjKYGx+KPgEQc+Q==
X-Proofpoint-GUID: EKuKrHzcddvccsao0E1JpxhZTsk1sUTl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfX5i8sxJe0Em/N
 s5sc/El/Dw7EhRraNIQDOHajbbSLUv9xZHsJfZCkaq2iqtB17qZK7fsuGz0W8obA6Ie6a6lvRrp
 rcipz7gW1fImy12pKrCrxvGQVKQVZb4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020044

The series adds a driver/binding for onsemi FUSB15201 which can be found
on Qualcomm Nord reference design boards as a dual-port USB Type-C
controller.

Changes for v4:
- Drop Assisted-by: LLM
- Link to v3: https://lore.kernel.org/all/20260916135918.1017527-1-shengchao.guo@oss.qualcomm.com/

Changes for v3:
- Address Heikki's review comments (Thanks Heikki!)
- Link to v2: https://lore.kernel.org/all/20260911073414.16711-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Drop include of <linux/mod_devicetable.h>
- Link to v1: https://lore.kernel.org/all/20260902045938.184221-1-shengchao.guo@oss.qualcomm.com/

Shawn Guo (2):
  dt-bindings: usb: Add onsemi FUSB15201 Type-C and PD controller
  usb: typec: Add onsemi FUSB15201 driver

 .../bindings/usb/onnn,fusb15201.yaml          | 152 +++++
 drivers/usb/typec/Kconfig                     |  17 +
 drivers/usb/typec/Makefile                    |   1 +
 drivers/usb/typec/fusb15201.c                 | 580 ++++++++++++++++++
 4 files changed, 750 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml
 create mode 100644 drivers/usb/typec/fusb15201.c

-- 
2.43.0

