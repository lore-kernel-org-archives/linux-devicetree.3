Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1A940DFAB
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 00:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777250142; cv=none; b=T9frvgLysYQTFHuhrCOxljeU5jXZhNwt6G0hkLe2ZPBL+6Mw40EzLgjSk/1xDn5wWIDMg7f2pwEJefdZkWRePCzfDOTFxUCUrB+1WqqhzQTt6Pd3kw24qK4Pfb1ubSAYx+OqwiJtPr7IRJOgOE+55k2ufXuoqP6pXQx2kbAFj2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777250142; c=relaxed/simple;
	bh=I9vwBEBzF6qvmginwcAWHcSprlfpe1heCUFvS+oN+gI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S38yWOzb2x/klYwu+qEmtUFmfkhNx5uR1IqqW2xNVUrl0WAcw7A0D81pBgADQfnJG7zXQupTZKhngnbozV1bjV5QwfVY2od1uvZBj2d3jVkD/gYrm9sdku2IrZgvPA+FbcWsWWzAv1arqo1aNrUWnDL5bPKmsYx5BrWHpWa30Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c7FiF6vT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KhxR7xwx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c7FiF6vT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KhxR7xwx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QIn3YG1162277
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 00:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=66XNoPkC1h0yJ/o5/2RJ/rNRxW3Sr1gZ08o
	mTrVbLmc=; b=c7FiF6vT28Um4NQSBk5urc2/Uv0Laq+QyS+hp/7o7wVkUTWk/ES
	KfVyLZq2J9kSHci4KSMBnxcOC4DRGpIHt5+A7JDTXj7rsBpXK8g4sorc8qmIRN59
	AYQGmFNpRRYEpIimUkanTTozcLOFMHu/RHX4VyoJgpGFbguYrMVl77zUIPuRDMFg
	fgqQgtdCmBewlAtfiMSi/7fLPDU3NLumIND2BkTr+0219M5bjzuCwpKT8enMQzrD
	BCutlqEP0PEW7bE584SbRUORZSDoQhTF05+7tXVXE1WpWRa+TlUG0RRWrzPF/hb+
	Te4sDnhNmZVXp8vl1yNUHOYfOvkaCv0oyQg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnu2ut45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 00:35:40 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c16233ee11so13304558eec.1
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 17:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777250140; x=1777854940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=66XNoPkC1h0yJ/o5/2RJ/rNRxW3Sr1gZ08omTrVbLmc=;
        b=KhxR7xwxBerJwyhbWJ69qWt8o5SbZEP8bvlTMIee/CdR0GRnfkCNEkPAVkkFbAD0mQ
         dqlbgNW8nFvSd6VEdQz7q80JTPVh2idVoCU866uy7XGNsJfLt11GraXrUBwzgvyP3nQd
         BveY4hTINDoYITWsDrdlQu/DAPSxXUNyfcCCNPhbX74ehY60L7BlxKZqFdyC5tqLfj1L
         LAYdgmVV26u3K/aNMbbE6bBh/+13/f1IHm7G0cvrmKLQ3xVROEup2B/qU1dv6+J9bD8g
         lDRr7GwjaWwyTHMXXy0VfMm0lS/CgN5sH9n9v9cj+hfCqiwBYGOo3vC89z0OUDNvjj8y
         Nrow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777250140; x=1777854940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66XNoPkC1h0yJ/o5/2RJ/rNRxW3Sr1gZ08omTrVbLmc=;
        b=HHx7E6VoI4q+ydgPtI9Q8PiU/+yWgr3WgKoAN+O7Gr5RXg2a/2BRwYSR3jpsoWIrJd
         7vSf1Msrlr5C2fb+OYueEkn5K69e9fgXps5WzWMNoe7+qRXO+y/cy9CA0o9I5xBihTbO
         VKMFaSX9FPNji/zt/8iyIR23+B+Si/08ggs6+yyiQnohZN9W3RQHEXs7w4xPjfcIbbHN
         lZLw2FbaIYMb8HpmDUiuOMqQLRM/pn5h/ufTCGp23ZOEEQAdqvQV3tGzA9iJGquFgIq4
         yU+Jw8osYlZpIF3RQk6GhFmY4UzJL2gv+q9zdbfa6SSz5lMxSudoy6eLJXVdP8jtetWX
         2+nQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Ww8o94QWsos3KpcykRniVQ22oPSa7bjORozwvJSugvQU+vkny4QkfbZmABel+a3QwfdcT/1T1xhy/@vger.kernel.org
X-Gm-Message-State: AOJu0YwUfp+3yLrl6JxlfhR4SMKdfjHCkUn2LFuCQ+gnIZau01v4k9QO
	de2zFJrSMyVEy+346WNFNuDwm+RaAs0MTH8m/VbXg2pcxq/RMIyuL/4FiwvMPQ6FtvBcfvS1Aib
	Jz+sPb4QBjOiv0TKXY8itDRiTGCWUX6C/4iTovSN1sqAgX3DWiUOoEWfXLNBnm6xc
X-Gm-Gg: AeBDietZZgrMJiYg3p0cIRA7T612k9Wi7ZCwqWlN1gYUCbRY9+4wXLkf9GUAJAvmkLW
	6vbpMpkUAeqSeeXjEWCE1bHaOI8QwzVo/4u9WRpLP2WVnckcKL6OQrGYxQ/h7jiRwCnXPvVGGRE
	KLmYwdxbDZSp9OZsFZdXBLfK45W+2POgjagCBlqlvExVQcHVf0cV7m99PDnAtlFkPAUaOdmQF3W
	xiZs2+Vs1N/7Kcz55ZGcEfYxHUp7xqA8av9pyu5NdJO38XdKRnSxR8P5e30e9X0aBBFWBBL7Vv+
	g28DaY3CzcoBjUuGW//dfay9ZW0DB5JhSZp8y7eQQfzlYSBS1gp9elxI6V+hGJTp1r4uOJLnc6k
	hy86kuvqSXqD08v21CbRS3KkfoNRGL1c3sp0XWKPNS+NI5zCB4tjtFa3bZ9DyrlKwmCJyG23Jla
	XCZQRXCdAOsI+j+umU
X-Received: by 2002:a05:7300:e60d:b0:2be:833c:149d with SMTP id 5a478bee46e88-2e479110f8fmr24716309eec.28.1777250139846;
        Sun, 26 Apr 2026 17:35:39 -0700 (PDT)
X-Received: by 2002:a05:7300:e60d:b0:2be:833c:149d with SMTP id 5a478bee46e88-2e479110f8fmr24716288eec.28.1777250139230;
        Sun, 26 Apr 2026 17:35:39 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d2ce98csm40010879eec.20.2026.04.26.17.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 17:35:38 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add SoC ID for Nord SA8797P
Date: Mon, 27 Apr 2026 08:35:29 +0800
Message-ID: <20260427003531.229671-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OF5es5G3MrXYrXULNQXbcqhdElCvK-l8
X-Authority-Analysis: v=2.4 cv=cbriaHDM c=1 sm=1 tr=0 ts=69eeaf5c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lRKjNYthlYtEnXt_nToA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: OF5es5G3MrXYrXULNQXbcqhdElCvK-l8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAwNCBTYWx0ZWRfXxspJfWgdprZO
 Hf8KIdftY+aHnBgcNj2CN8MQ4kjTOLySvIoFtdGNz3/g2P8lYfxCxcaEKN40JprethaKBLf66M0
 qD1P2mD6yDKWYz67iBKryWHJIaN7s926kRaqVw6UKxVfae8rgQSm/p77uTdCHwRr+bL8bEk/i35
 OfyrixqOxr6xuqOlQxnIdbokykOrzkVuPTdbQfmJIAuX/obeLRlikcQWQw0/KUN4AapEMONBUi6
 1hcz+BAx/qIMcNXKPZZ+GlgTZ9O2eABdgzt9h+ULipxBGHLGRLh+sy2ce57h7KR8ggZu3lrAObq
 35EmQl9cxR5QtnaNfDqT3yR1+vl8iS29Qzr8xcnUhWo9gskT9fs13+H8TteQL+ncBoa90L1yYbv
 JKW0qvhPAUJ1OHcyX3mMyHbLokXNH8wAsUstKEAIaID+WwNsGi+cHtQbzTCLyQgIkLn6PeXLV04
 RsVtbt3tm7V7aJkVCHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270004

Nord is a SoC family from Qualcomm designed as the next generation of
Lemans series. SA8797P is the automotive variant of Nord, where the
platform resources such as clocks, regulators, interconnects, etc. are
managed by firmware through SCMI.

This series adds Nord SA8797P SoC ID to dt-bindngs header and socinfo
driver.

The SoC ID of Nord IoT variant will be added separately later.

Changes in v2:
 - Drop the Nord SA8797P introduction from driver patch as binding
   one already has it
 - Change typing style to use "single space" instead of "double space"
 - Link to v1: https://lore.kernel.org/all/20260421040231.1256998-1-shengchao.guo@oss.qualcomm.com/

Deepti Jaggi (2):
  dt-bindings: arm: qcom,ids: Add SoC ID for Nord SA8797P
  soc: qcom: socinfo: Add SoC ID for Nord SA8797P

 drivers/soc/qcom/socinfo.c         | 1 +
 include/dt-bindings/arm/qcom,ids.h | 1 +
 2 files changed, 2 insertions(+)

-- 
2.43.0

