Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794562736;
	b=F8Cg2ranoiMjgX6oiNVhy4gHqWsLHuYM3AAEWsek2oqV+bYVxyzbHqqe41KA2ZGjfklc
	 AqVCToSjb7Mysn8Ys8BMwB052LQ6X6dlHrA3JIGhMYRc4DHGoytyEOnvDuCgPqE8cKDJp
	 pJFlOaV6XbG+6pntIBDkIOrEutOKt0iTrUKWdwNmL5YL/xWy13/9+hWYQ+YjQ04JOBSzx
	 YBomq6hUbUJ3vutMnGRQRgtTzgpFT2P03B7jmaVExiqicpDJwmhGUb3hSX1FdlWB3Df4z
	 r2j6hlYJlyj8iIbCDqYm2l/A4lKQFAmXWif11V+y/Hrb1878RfWQgmHhNfXCgKM8zyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794562736;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0xdc5hE8DpjyjG+3BwiQWwntxFFfPKdzXzf7D3MWa5o=;
	b=oH6ROtukvgxdCaqMWsdKX/m49P62EnSAjdhciLDyHqKkGnxVr8ljSmWUQqL23HSgOh3U
	 sFYmzFhusIp5PodH3qtuFTahJ/dq5vzqWn/CksqTDD0Tb/AEeOeB9yOL/rPmR9TlTQnTg
	 bHpiwuioOVrQfYfk0idRptfGN0JqCIm8wcd6W8p8YehI8p4+2vfS/yUzv3o05+Vlzi2my
	 nolLCZBppII+6Z4senufNY2lOFaJTd7gxDjljwMuwNHVN4l9LkYxDZ+rixTks9oCLsC3n
	 lvUEQnUICT0lHofnXgNAi73ZH1tp8fJwPftgMK1Vj/svODOXuCI/Irp3772sRq5uQ5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S3NAKU1m;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Tb9sg/xS";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C83606A323
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 09:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1C83606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S3NAKU1m;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tb9sg/xS
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8V0sL4101628
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 09:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0xdc5hE8DpjyjG+3BwiQWw
	ntxFFfPKdzXzf7D3MWa5o=; b=S3NAKU1mWFHhIVE5xrQRp70Qg5h8j1oLzQePcy
	DyiUWYqA10HzoVw/c+WI95Su6LNOjRPnxOiWdiDGzisq2nCxKFEwsuOjF3eW7d1T
	kCeYuzqNA2WtxCBxuaqRdGnHzu6fU+J6iYERgtkhCxU1aoV5Ht15U91k/HZZosXt
	Tc3GHy4VnybGI2Pg9R+klahTW4NHFl9e7RlkdDgL5RskRkKM/vI/vjPvkNwUsYrW
	QF84fVlm7KvwkfmJTMcelTY9QUY6pd2y4cf/Q1FPwwYYt2Zpl2UtFK9hYn+05zCq
	PyoG75cIk+z8QCujtKSvNwf1zkSZe4+wwWCNYmgNszjRUsBA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdjjte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 09:38:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f3969a2a7so126379285a.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 01:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794562734; x=1795167534; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0xdc5hE8DpjyjG+3BwiQWwntxFFfPKdzXzf7D3MWa5o=;
        b=Tb9sg/xSB4iG7uQGZ32tH6ZLpfgUG7knxQf8JEH5Z6jOwMZJv5XI9YY9lnns+cLOt+
         tl94uql9fE68mu+7Pgl0TWIWftghwL/lIKAyI8uKGKBfFRockQXAtDUKcIpDMkzi3qO+
         pKdHvA42mltM34pVF5KyvZQGNrxJqubCUCAURoK0NDcFnjuaUQ4N7Vy3L9OIhoRomPmr
         b88kTU3y+RbyQJ8v1qfLUiUqKCl+KY2TF4gLn9MDtwYVRDQUP7owQAO8hYEzjvO0+tqG
         Mr8bizFb11M3H1Wc1aJonuu9l38Zstecv2RkSiviebM2WhsdWNDHime1XuzJZc/ayNKZ
         a7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794562734; x=1795167534;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0xdc5hE8DpjyjG+3BwiQWwntxFFfPKdzXzf7D3MWa5o=;
        b=kTfl4Hc7w9OiQrIMe0fUb+5YUjG5dL0GvMXQpXHlczQCSvWDxctetGBYfnQ5UeLxW7
         AhxnhXZnZG+j4VDfycIljwIGVaBZ9e6CbRPBh0LPYbDUZc+vwsOeDwXLiK7ezdUCncLk
         QQhZHuOKT9ajP/7DtkUjqqt3lByMkr2764S7j2qrKDUCoi72AxjZF/amzzJ6JP03sg5q
         2oXKqtF+NmaaasySbv4wnB23Ys5kifW6PQezVZB4QkuScujA7Uuv8XVUU4Z4jIijgc1+
         OeEsjiXhku0l+fpZIeqs2BGc6DuE0SvoshzuU4Dkr7Oi2rADXxXKk2ePAW66aQbPTgqG
         KK7Q==
X-Forwarded-Encrypted: i=1; AL+hErGKKkrD1f8epMUR98PUvjun303D+DLJqJ4QK2z2KaI0OqmHNkCFt+MKBpCTN6D9Nlk/O5hOwqNFj8W3@vger.kernel.org
X-Gm-Message-State: APuU4Z/6lWjnGRj2TQsKJ021EFibBAqPR0ldiagdV3VEHUnGYu6RJClp
	cQ+tQsmRtmLkLkZCpkMGCFkT8BHJZ4fgi/aMWbq5M/SwD3azNav+QBE3CCsbKKNL1CxCFeNpobX
	pldKiKQI8TOOCtJD3dlkYj0i74G+gWkp+Q3Qcv++CbCeTb9ZaZuNtq7vJ3jkVxqYj
X-Gm-Gg: AYBFou3SemUqLrouz4pUWW1UOxOtZJVofUDq3oeGYQjysqQ7YzKrpnXzh8h4qYajaIh
	/ZL2pNyPmyjE90mDv3QLY8ueJAhTdzzVB9JBzN5bhAdagTvnV70KTpJx28tj0qX3cu6/AY7PnH9
	qXaTpcjRi+B6IpMEbANW+jVlzFWqJzlXQRPuXFr6iPKXFmkRTB+M8lHKRGeWMn2JAT6ILmCAP6O
	dYriwtPlo9hgjYK3/+w5C8ziCN9iBq8rF4kAm5wAT++W2iCmKmns9PueEOkeuEtIVI+RhjQzd0C
	FGZ8ZObv3osqcEpBzvOfGQvkYJts84cb4NyZx0BrRJHEC6LUFAq11SWCd1C9Lb0LslYE3PjviXZ
	lh9nGgzVEoR7es2Ul07bQadzhlxcQ3hd+Prd4A3RkyQmLOdwyDJHvbSAmoarR2xOXVkPAI/zVlp
	lE7aZGJx4pkclKJKlDEWCW3JR6vZCjB1v8r+LhlAbzerO+dN5AikslLMflLzPTX6E=
X-Received: by 2002:a05:620a:801c:b0:949:3ea1:3021 with SMTP id af79cd13be357-9494bc813c2mr316648885a.68.1794562734104;
        Fri, 13 Nov 2026 01:38:54 -0800 (PST)
X-Received: by 2002:a05:620a:801c:b0:949:3ea1:3021 with SMTP id af79cd13be357-9494bc813c2mr316644785a.68.1794562733666;
        Fri, 13 Nov 2026 01:38:53 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55af2901sm46458455e9.13.2026.11.13.01.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:38:52 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v4 0/2] arm64: dts: qcom: nord: add GPI DMA nodes
Date: Fri, 13 Nov 2026 10:38:47 +0100
Message-Id: <20261113-nord-gpi-dts-v4-0-e4a1510687c0@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAKfa9moC/3XMTQ6DIBRG0a0YxsXwJ0hH3UfTgQIqSRULlrQx7
 r3oyJg6ecl9yXdmEIy3JoBrNgNvog3WDSnYJQOqq4bWQKtTA4IIRxJzODivYTtaqKcAGWIFLxC
 qRY1BmozeNPazcfdH6s6Gyfnvpke8fk+giCGCSFBDG6mw1OjmQshf7+qpXN/n6YDVi2RnEHwwS
 DJYQ6RQsqS1ZCcG3RvsYNBkCFaVBaaMS9n8MZZl+QGiIXa0NwEAAA==
X-Change-ID: 20260916-nord-gpi-dts-40456500b7b1
To: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=RwehskbQ1DB+sZVbr7CoWy/j61pb/QRhK1GsIRPbAXA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9tqrvAVdZ82kCH5E26oIbCtKVsbN6IcH0/JqC
 4ogR12yKQqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavbaqwAKCRAFnS7L/zaE
 wx4kD/9tBMB1RWvzV6L9zwrExf1tsQ6t1otqngRLcnuO0PCwUAXVIFP8r2gQbvQkDJ+C5KUU1JJ
 mf8aiQsslqKB7OLrZzcF42rWgLWR4OO8fKLBRQh10rWIOSWRXO2Snq+wM0U94TFzr8M/HNBuUj8
 9S1a7BFBO8t6oYPOu/EX7aj5uaqGsy+TU7FI9K9u3vQquTFLCii3GMh5yG7yD05fYBWfAdk/Au5
 yFXfZKmwUqJxvVjthm0qE1V/Z/uU9WDR9iOZhCPfHke75fxbuue8JZWLcoddchVxhrAKQ74l/cw
 Q/6WFFs4/9/EtfQA1OQMYNZ1BcjM8O38f6+rg+x/gwV+XQJpokhxJXN+rzIKbS0RbHRNFdE9Loy
 MC7SpM0tUVfyR0sEo7Pj2FnpSOzBY4IUSR6kGvhOXY7ekGK8QqkYevuls/0w2wdBHZB8322AxVU
 CD0yEmf7ZO0Ep/DO7HSuWPIrahxHOkBjA/afToNei029zXbHACXmTVcIZbcWpOJSF/xD6pblOcD
 u5IP9OQOCihgPabrcIwNNoGVEVXNhYJLgCxiUO13oNaj57KWzG3E7sWF8NUVjz41P29poAgVMek
 T/cqiSFSM+mrn6BnbgMsx6kR30hqZoT+jV1kuwyNxsCiPHT5nzTQRBwHvSRsp9y2BoreTlDRvqs
 wNEoiIG/PqdNAiQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzOCBTYWx0ZWRfX9s26sYyh2Yed
 xcd77JlBuxq35x0fzh39vIWtyLYpSgsM0EWoPpC0eGEcytLKk/T37wEDFyqTw3xVHgpjpUJSyxB
 SO4dEszLV1kdkfnEeWy7WEfa0bAb6BA=
X-Proofpoint-ORIG-GUID: 0pjLmjqh_xvmeWF-sUBMT4mbhSte_sX6
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af6daaf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=Mjg7qTZfclGnlj1MreoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzOCBTYWx0ZWRfX9k7e0poCraIS
 yjtbjR4+cgPTVRVDTTa5i4FQdFbSnew+Utx7PbzhmTgeV+GqYkk2c79nywV/qy7FPKji/bUN8FZ
 LkxVgqzCx5yxTjJHZqv6uz64iMNbSy3Urq9b+WOS94/qtTvL/QSaFfYbKQvu5mVRGH39bXsiV9h
 ysBQNgcpH9vZ0m8lEHnGRyXak57K061PhoVN3zEqmFIvjZS74nWE50WZyfKxxI2qh/+uXoZb/GT
 /aYCK3TE86/y56TsnaUR4T8dPWqvWcfXkfuaHSsWa1owBS289H/mHTyfXEdWvDsJHg15JZfEhP7
 yncmZJt27WZs77DsB9ZOxhggfNf39B0dQNIWfBYrPYUwqdpeEBaWPuEAETYP2gRNi/Qun6ZYpGG
 gcHSZpPRnBAlJyV/tKSXFyW9dXSKiwNAjXTgw3pjjVvE5SMtC+NebYTyJ3pOTFrH+DKF5GPJrOx
 R/6ux3RQeJxidkDBrXA==
X-Proofpoint-GUID: 0pjLmjqh_xvmeWF-sUBMT4mbhSte_sX6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130038

Add GPI DMA nodes for Nord and reference them from the QUPv3 I2C/SPI
nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v4:
- Rebase on top of current linux-next and resolve conflicts
- Pick up tags
- Link to v3: https://patch.msgid.link/20260924-nord-gpi-dts-v3-0-74a85134699f@oss.qualcomm.com

Changes in v3:
- Enable GPI nodes by default
- Link to v2: https://patch.msgid.link/20260921-nord-gpi-dts-v2-0-4f297c983b94@oss.qualcomm.com

Changes in v2:
- Remove dmas and dma-names from uart nodes
- Link to v1: https://patch.msgid.link/20260916-nord-gpi-dts-v1-0-073e3f9c19d0@oss.qualcomm.com

---
Bartosz Golaszewski (2):
      arm64: dts: qcom: nord: add GPI DMA controller nodes
      arm64: dts: qcom: nord: wire up GPI DMA for QUP I2C/SPI engines

 arch/arm64/boot/dts/qcom/nord.dtsi | 188 +++++++++++++++++++++++++++++++++++++
 1 file changed, 188 insertions(+)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20260916-nord-gpi-dts-40456500b7b1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

