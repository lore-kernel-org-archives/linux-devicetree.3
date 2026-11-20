Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178814;
	b=cz91KG+mzFNZTvYCyKUF3pP/n7qYn1qbevfJ/S17jhvwCl0j4izg03XypCC8HuOJEMug
	 VAeXs93qPIW17P1ys1i4QoBCn8Cr+VbOREruOqTRZFSYX4quBRSYdZSjlqLUC/7haVMr6
	 k9XmUcMbZKQeEwmnzbakGzSS71m6M4pytPE/DF0fGwk+NX4EEJXf/3UDfv5rsz2LY9HaN
	 3ta8AiyMe5hS5M26ZH1emX7xNncX9PgCSbJlEldHe3FbpvMLWDZMvsixWFx4IyZHoSgz/
	 fex7LGjhytVxV48WdHJxYwh1DnTupQcqf6u66FviypVvf/n09Vpc6Q94MXO7zCzn0VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178814;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GGZq+HX0iaPQ17xYik2Dtq7osyHrjasQtnOjIlmO+eU=;
	b=H1jFD4ibT5Jz0MDfmSIHmrYrOK4bMXOYWgTqtbF9/vENjU8ELFMK/otjjDP7T08DmcHh
	 E3QEvct+cz9zHC7KG0UVLcuWmtcPvTXY/07OBUSuG5Oe3o/al1LYQbv/O6dtc/w9GQmuM
	 bPjTvgK9+MonsXyXmYGBhG2sRY+68kavaFJ/aIXp533x03vKI6DuIR/AdccsdBFN+wuBg
	 vkbMO0J0Seg8Up59g7KwaS+kANeE5daXT3aRw3isO0c8MLb3891b/pODcbQmmk1Q+yvL0
	 oJRsww2tNt5M8+5qTWkn2Cj9f6OGp7/RlKSaQ/fggq8tRB7pN4jp4HN7ktX3UjQKADA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XbQ4WCRr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="KhcpW/wN";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E06606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4E06606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XbQ4WCRr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KhcpW/wN
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjte21528511
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GGZq+HX0iaPQ17xYik2Dtq
	7osyHrjasQtnOjIlmO+eU=; b=XbQ4WCRrZ7ZSTSrVFEmTxEgvoSFrZut0eQy45P
	KX1kqJWFOzgOyz8L16Sy9IgxloYUHbvmlHUQLojXzh6IJBFghNvBYn81GRwCV/MM
	6XaGcykpOmtPRwkyRvO3h50zF8KAxEmXRpCvUaFbCGfyXfolosQtVJFkY/SbPX40
	ZjoT4AIXDgn1llwSSymTTnoN/+fgK06bnJtprFDcAaMsynRJrmWnqYi6twA2uXs3
	IyEt2/i56STtV0vo3jCHoPNbKd9NTeMWH89mRYZEiCqcMEHrBTURJzI0WMcXhTwj
	Rf4nQCWnrEpzxjuwMtyB9f54fHh0Gk7hZ+vGvbp94KWDz1dw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjtsvtw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:46:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-948d83322f6so160386285a.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 04:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178812; x=1795783612; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GGZq+HX0iaPQ17xYik2Dtq7osyHrjasQtnOjIlmO+eU=;
        b=KhcpW/wNCYa+63LIWuFzelf9HA+nouy0kDEFM+DO3g81lBsDWbfNotQKqIBPJG+oAz
         QYsTtSHfVsFhHy2RqW+exveqON9D/kNTnLdnjeGErOEccH5bCDejIW9NHa1pNra2XIGE
         Peh/hvkRLYjNfB0UP2fRnqPNLEQ7NwHoAa2vT4x6e6dKLdBmfeLtND5owau6LEWJx5Bh
         SPrNJaGjFl4HJxUjtdZ6RRCR4N9s2IQJOG089Hbg72TwKr/7Ex46BXpuhX1ziBK02ljI
         sE1AfEqZnMArOG7Y+XuKBduxV6wBDZmx6Kon1DrIxiyODHKBKcRxmmWB2AlP/qO/78no
         5ECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178812; x=1795783612;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GGZq+HX0iaPQ17xYik2Dtq7osyHrjasQtnOjIlmO+eU=;
        b=BXeRFgtycE+uEJjcsC3Y4uRaSuihQjMdi+06LutptvGzoKJHZWO6jQ0ns/7D6lr8T2
         ld0AlvG9EVBEADzGONacoBNRHCPd0AqUJAKkPUjcuDkFYSfZxMFN0jtqpryqu1XV48UB
         40aehGSx2MZE9rXXtqYs3KAOhJI9pssKZZW3KqEH3CvqyLI9XZqLdGnZ/5ZtsBbfpBJi
         +ikmh0uzAnu38BwKuFj1R2z5mhu8DRkLrzLVQ+DpqkdktB8wXZ+iQggPZInXHmhWpYUR
         aQ82h2ofUGC2T70EzCpmnPiwTUW3JQiEYEls8bLWQnwfQSEXAo0G2sqVOZsW5cvRG3xR
         TZ2w==
X-Forwarded-Encrypted: i=1; AL+hErH91BEj/SDDp60yIJ2MGc3YOw62bysCOBY6Y9Hkiqh26KrGqmPR7NydR0Qjf0RmjcuZQRD2o7FafxQF@vger.kernel.org
X-Gm-Message-State: APuU4Z/yfBACiVsdKw9YcM/pDWgLnOgSJQda237U9RHvf3igj9FaPRsr
	f37xkbkSiUCXlFiai6418lID1ZhewpwNZ4UZin12yAyBmfomEEy0EA2xvPl7gbQU+A9OGR/sfpB
	WOlAcV+LIIjTYZPU/BI/T4BwzEvwuzHDwm9+W1fwBzUQj1S1HMX1K1T1/Pt3NcpSq
X-Gm-Gg: AYBFou1vXYScHPLtSSUAoJ3e2QG10W0zTYicC4P0tPBm+OvMrkBR5Hu/IyYuQWvZIvc
	MPSPC6hyRqdnsEnAVXsQrJ5q2s32lEqHWuQni7kE+CiuB5LTieWnTGAsOVvJXbcSsKJJMEbKXQx
	4P29pbY9RVh8Vd+eK7+vrB95BkxABu59ypoYqyfIA9aL0Mksc9CxYKTGxcTIcSk+BmWcp0AuKte
	0RxzmAs0ILN30BTB4Nu7NRjQYNPEneSDh/4cEdHgrsqo/7QDQ4a5WPhXz5BBpP/fL324zt8EWNz
	cRqfz098HMQ5kCHI068EEmyqGZIGCqz6G3jDnI6cpqXahTdhsXasCfqFgzUlYWJaqZVH8BqqpOs
	XmhcpJk6t/Ct4jJiTYxtRAK3FGNvZtiOvlQwlS1BE/7eDstBiAMJBc616OT0OK/BF+ckUnO14k6
	I=
X-Received: by 2002:a05:620a:6497:b0:93e:c12c:9b73 with SMTP id af79cd13be357-949bab6dd53mr385752485a.78.1795178811590;
        Fri, 20 Nov 2026 04:46:51 -0800 (PST)
X-Received: by 2002:a05:620a:6497:b0:93e:c12c:9b73 with SMTP id af79cd13be357-949bab6dd53mr385748685a.78.1795178811127;
        Fri, 20 Nov 2026 04:46:51 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm119248995e9.11.2026.11.20.04.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:46:49 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 00/10] gpio: make gpiolib-shared more fwnode-centric
Date: Fri, 20 Nov 2026 13:46:37 +0100
Message-Id: <20261120-fwnode-for-each-prop-v3-0-808e304dc73e@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAC5BAGsC/3WQQW7DIBBFr2KxLggwgdiKqtyj6oLCYKPa4IDju
 opy92Kniy7SzUh/NPP+n7mhDMlDRm11QwkWn30MRdQvFTK9Dh1gb4tGnHJJGyax+wrRAnYxYdC
 mx1OKE7ZKS9dQUHV9RGV1SuD8umPf3ovufZ5j+t5dFrZ1dyBjVDwHLgxTLIEfHTCjuBHnmDO5X
 PVg4jiSUtDGXfgfFqv/YfHCEmANr+3BuAN9wro/Qie4XMsL5kdy9KEz4G3Iz20VYJ3xr1OzHTl
 Cznp/UFudTFwgEaYaIaUSVJHOz0QP6/kTUoCBxNS9Fpv7D93VeMBxAQAA
X-Change-ID: 20260916-fwnode-for-each-prop-d7a6f90e7338
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
        Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5083;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gj7Seg7pEQk2GZ/suLjtH8uyZWO74zJ9xG0nzF6H9MM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAEE2ansYKCUJ1FilkZ4DSlf2TK8xh0XTxR1XG
 I9L8p0loxiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawBBNgAKCRAFnS7L/zaE
 w16RD/9xI6g7I3JgyT030E2vrM2ruU3W/KTFNSMlp6Yha+r3djrt2cyTBJ/kUKPLM3IwbRv4+7g
 U0t9K4fEPpxZbAbr0Rhn/wjeATureoyXT2BfQKQ4lQKLOVLsV8yx5fGY6NxprbxJWRgt/Zk5BIt
 h+nRzSjpkDN5aeQ2S/AFtOjBcy5krrcbDi83Ari6dU9SfVW+2EnNPlA7v784Wy1/5Ue2zywxkio
 n6pCysdAetqLrr7E2gSQOzO8Ak4I+CG/ikmU0g4YV8XDW25PVJDiWjwKHcAkqmMZuIxK+gmXgdk
 eYcBOKV07MOSE7mceCS/uL55P/VDr3pBRhKBJ8kgHvc4CDHKHxD/qYMKf9IkB2NQDB7MJzvEIJY
 EkdcPe1U6v29rD7HJUcMlVro7Q/dhjXxli1Y7+ztCTwEfEK/n8lbLzfcrCcI2qQz+Nn9PA0nCow
 Shdi5G6MwuKHR+YSjb8m6FLcb+KxV+wRtRDjkj6Lg/oUtKtS5QkYmU3K/S8AoHyXu5IlJXoRG3E
 Q4tH2m7YvZvtmPhpHXxVGWE/Bhyf5pkmcpV9ZhfrQLwnpSN/FN5NwKZ0ii5uMswFXDlAt8RopOq
 AWscT1GL4sMqZvQnKNpqSlsc8WJ84fvRZwM7O/6pHyR+Mx0FXls8OaRkuX5aRSnz3vZDZGZ+pdV
 jH7myhlDZcWnaiQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 0LF8hqFSVPT0StrqXJyoBU5YTN_yGf8c
X-Proofpoint-GUID: 0LF8hqFSVPT0StrqXJyoBU5YTN_yGf8c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX004arvldeB3o
 hI1zxi4KCfCRQGaYQB7cQWgVAXlzaOiHqdHWO9Ej6APUfklIVrK1YLQmFePPnU15Y5ACKJSk7kz
 uN6nJt2MSlTovhe/ZDgY5XGEKytVINClGpEfqnaviiHsv8PHh+q7pdiyPo/8HTyyOKna/qvI7ji
 1rNbXR8mjw/bI7mM7rfI+JN0IEArAYZAtQxIWnICdanRRoqLM1lQq+lZIhitjJncTLv46gDt98i
 dmmZP7l3M7mEyOUWujSgxssrk5qdVOa8by5xaayP5cTJhg7deQNoRbF5cD0kvVIpaHJc1kELj/7
 Jezg1e1v42dcmua/HaoPdY29qyRjfykofTiXVGdOXlyMhPbBvRr+9BpsYdg+P6soOyoqIcf+LJa
 24xh/BLweM9XHfIh6471S92QONuFRbBiOnBEZIeLWIW6Fe53HjKEbeVdTb+VOKHV8z2s7LQhLcq
 GiO4xQUeXbIb5/4+1tQ==
X-Authority-Analysis: v=2.4 cv=XcccX455 c=1 sm=1 tr=0 ts=6b00413c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=268TmXAmZi7PCZOmIe4A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX+vrJuh5Gldfg
 qx9zJmfoghDhl7vrMAURzlTYZ5l6EIUiFhoC6bc1rxAPEiPF4GaSzN542HpHdW4m3q+C35DLENm
 WKJew9IleuboHaf9aYUqze4Eln+LEVs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200050

Currently the code in gpiolib-shared.c only supports OF nodes and uses a
lot of OF-specific APIs. This series attempts to make the code more
generic, ahead of extending support for sharing GPIOs to other types of
firmware nodes, by defining two new fwnode operations, implementing them
for OF nodes and using them in GPIOLIB in order to limit the OF-specific
API usage to only a few places guarded by ifdefs.

The new fwnode APIs are:
a) property_get_names() - this closes the gap between OF nodes and
   fwnodes: OF nodes allow users to iterate over all properties while
   fwnodes don't advertise all properties in any way at the moment
b) count_references() - there's currently no way of counting references
   in an fwnode reliably: using fwnode_property_get_reference_args()
   does not work for empty references (e.g.: phandle = <0>, <&foo 1 2>;)

The first patch adds a CLASS() for string arrays. The following 6 define
and implement new fwnode operations. The final patch generalizes the code
in gpiolib-shared.c.

Merging strategy: patches 1-8 should go through the driver core tree and
be provided on an immutable branch to me so that I can pull it and queue
the final 2 patches via the GPIO tree.

This series depends on the series from Alejandro Colomar adding
strprefix() as indicated in the b4 tracking.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v3:
- Rebase on top of v6 of the strprefix() series
- Initialize variables managed with __free() at declaration (Sashiko)
- Unuglyfy the usage of IS_ENABLED(CONFIG_OF) (Andy)
- Pick up tags
- Link to v2: https://patch.msgid.link/20261113-fwnode-for-each-prop-v2-0-4edc23d5cf50@oss.qualcomm.com

Changes in v2:
- Integrate the series from from Alejandro Colomar adding strprefix() into
  this series as a b4 dependency
- Reuse the existing struct strarray in the new CLASS() for string
  arrays
- Make sure that props != NULL in fwnode_property_get_names()
- Replace string.h with string_helpers.h instead of including both
- Tweak the kerneldocs (Andy)
- Use size_add() from overflow.h
- Mark gpio_shared_fwnode_traverse() as __maybe_unused for !CONFIG_OF
- Return early in the OF variant of fwnode_property_get_names() if no
  properties are defined
- Add commit removing unused leftover code
- Remove useless alias variables
- Link to v1: https://patch.msgid.link/20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com

---
Bartosz Golaszewski (10):
      lib: string_helpers: export and rename struct strarray
      lib: string_helpers: implement a CLASS() for string arrays
      fwnode: define the property_get_names() operation
      device property: provide fwnode_property_get_names()
      of: property: implement the .property_get_names() fwnode operation
      fwnode: define the count_references() fwnode operation
      device property: provide fwnode_property_count_references()
      of: property: implement the count_references() fwnode operation
      gpio: shared: remove unused field from struct gpio_shared_entry
      gpio: shared: generalize most code to firmware nodes

 drivers/base/property.c        | 115 +++++++++++++++++++-
 drivers/gpio/gpiolib-shared.c  | 239 +++++++++++++++++++++--------------------
 drivers/of/property.c          |  41 ++++++-
 include/linux/fwnode.h         |  15 +++
 include/linux/property.h       |   4 +
 include/linux/string_helpers.h |  12 +++
 lib/string_helpers.c           |   9 +-
 7 files changed, 312 insertions(+), 123 deletions(-)
---
base-commit: d785d132202e8e8e93335ebf74ad5b29fca0951f
change-id: 20260916-fwnode-for-each-prop-d7a6f90e7338
prerequisite-message-id: <cover.1794667407.git.alx@kernel.org>
prerequisite-patch-id: d3e70dd6d3b14266595580dd0a45f358ed227c2c
prerequisite-patch-id: e0431bc18c6ad9be618368f3b128a6146b11c761
prerequisite-patch-id: 62b224f17ce0f2e68e8963de1180d9764dd24fe1
prerequisite-patch-id: 49110713d1b10ae2972ae738da383215d9be001b
prerequisite-patch-id: 97bf1ce8e594218715d5df30711d0523c7f07bc5
prerequisite-patch-id: 7099f0089dde47dad6548bc2dae7accc71737f84
prerequisite-patch-id: a0c5781fec5351c5e90d1edcd4b4faedd4079e14
prerequisite-patch-id: ea193b5da63539c30bb889caacc564202d335c66
prerequisite-patch-id: 0166cdc28724d37e716e5506b1c7865acc764e66
prerequisite-patch-id: c35ed24ac570ec685c6ede5cff80b9b140bd09b9
prerequisite-patch-id: e38e553067efe98f8c6352ce378e8de9e3491379
prerequisite-patch-id: e7d3995c1e740354072278a4f700da1848bf2d4f
prerequisite-patch-id: 5d211c7ce1cbfdf9fc8a7a6432989194f9f6dac1
prerequisite-patch-id: 6708d2610b6972e7f8f505492f341d4c0a7bb476
prerequisite-patch-id: 8e386ca3fa87881fa6cf0f00bfda37542eff8141
prerequisite-patch-id: a00aefd04979c68dfa7ae79dc8c4cec5593ca732
prerequisite-patch-id: 5a46d25bb0e28eae712b6ea6bd0fa247a79e0365
prerequisite-patch-id: 02fa7159f2a7660dc7b48138fd48e929c56cc9ae
prerequisite-patch-id: ba05aa979cc564730fdb522e1297a7ff9636cdd1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

