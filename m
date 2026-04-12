Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A9517A2F6
	for <devicetree@vger.kernel.org>; Sun, 12 Apr 2026 17:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776015155; cv=none; b=WmQ0T9TE4gftQTduvRlXmmIVo3C98xwLt7336d7WP9C1u6BikcGEuLJ1B+Y7YQXpOcLJBR085psJhuAxmWC4ya3DHJtrEuBasdnJMzBSlHcmM0U4bbqTOZgy+rLrWeM31deRNy6JrXTXOAoFXRNj7umIU1zZhvbJKlhbiFMMQIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776015155; c=relaxed/simple;
	bh=Soqo5q+LEfVr+3Noi1uaWeIlz7pyLr4dy0IKkD7AqHE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qYHz9pqEwT9Oc1jmMAGr1wr+NZItJjIPu3+vlLDWE+dhWTpLTPpcgHYjH3DH12rc2pLrAeI0L/etDTFt1Kq3s7PBOWWr72lWEQ977hBVTR4BBwBbDT6TFcNQcwn9fypVzdBBD93LE8K7IbMyf9eV06tKd0n4S1cBmRUkcobL/Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m2YQq/Ig; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fsld3DMs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m2YQq/Ig";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fsld3DMs"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE4lm82662072
	for <devicetree@vger.kernel.org>; Sun, 12 Apr 2026 17:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ObY9dcBzdReWuRlU/Yfk1K
	5rEAWdMtpDanJl2sCOrF0=; b=m2YQq/IgwubkUrN+hKX/MkJoPX03SktU0smZBg
	dZ9uzIC5s/xObe4mftWGLzJdFduSzS6BtBJTSR+rgYHkemS2d7XysB7wNUz1c3bD
	/w2w0DynVa3todmdmg15I9e5JvDq8hZTEYGayGIzFx6EhSZujovVyJQiSU5lR9qS
	YFHKMb8ma4DTeOc+Qd9U65R+E7912C1q1nGaQpFdnkrMhOtmZnRuot0Dfl9wW5dZ
	1ZIM/kcIJu+gbzkmzNTkwH+wNmzEtl7DKdpmN2WfplhNV7za65iD4d5FZWBq+S2U
	QhJZOlh0ktSBdz8VKrRDb9WB7Lu4cmHI5mmcdADTcGstUf8A==
Received: from mail-qk1-f168.google.com (mail-qk1-f168.google.com [209.85.222.168])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexctq8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 12 Apr 2026 17:32:33 +0000 (GMT)
Received: by mail-qk1-f168.google.com with SMTP id af79cd13be357-8cfc8e7f987so621730785a.2
        for <devicetree@vger.kernel.org>; Sun, 12 Apr 2026 10:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776015153; x=1776619953; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ObY9dcBzdReWuRlU/Yfk1K5rEAWdMtpDanJl2sCOrF0=;
        b=Fsld3DMsvGY7xEi/6fRQHjw/l7tfbBGNue+QAizeswI7f7QVl4cVv3v3NNhDXVEZok
         GwAM8pUXozvuTwMWF7B48tNlgVj32v1V0NuKOSm3ooztNX6tly4zZXYL0oFpFUYBKX7n
         ooP3XR4Z+J8kcHEOoy9FatfwU3nBRV3wwYkhXpVMLHzpOdGi2ZK57LV/CF4UH9YfW6qU
         0wO1UMnNnaXPqIk5GqEsTf1SQuCOgcC0J4647GOWHWEKV2rd1lKcrWGqlT7btTv0onDX
         ksveKOfpDmZbpIKP/k20GRrCLfhbYfYDHBq9BTTcWhvW+MPX7M1j/VL2toQ+CykRdmiq
         LbfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776015153; x=1776619953;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObY9dcBzdReWuRlU/Yfk1K5rEAWdMtpDanJl2sCOrF0=;
        b=nAETPQ1/Apj6CCLL4EvNqSf7deJVDWx8p0YVJQJmMHrFrkv4a3OXZtuk6IFftzL2Ix
         hRGJkWa3HibhflaS9E5OKAcFk7y/C/rIUql1Jy49d8VxCNsR3C/K/FUbd7iAf6h/PfIk
         pKtXaE7eeTars1VkacmY4thKVmZ18YxwNjHiEEzknDrcXt7vAWii+2BmpBvQpIwG8DCE
         nU3lRgV+tMVot8eXwNjcE1N5NKir+7kbiYN7P1OMJR/84Z/0LaehqGfOcMdlRYHvmqM4
         RqLIKcszgqvv38HSQaBLbnPt9cq2RitiolYv/PDp9DqN/0hSusL9taiexqd25mtOMTld
         haVw==
X-Forwarded-Encrypted: i=1; AJvYcCW0y4iDfIm7uV8YSH1Eg/iAGPYCoKX1vzdY2NOuUv3eHlzNm7RVVkXJzNLf1pSv570i2WezV7aGcRN7@vger.kernel.org
X-Gm-Message-State: AOJu0YxtCk4j28sZK//FZdsoLKky4AZuUbVq57w8FctlpdPwfI4FQUGk
	EdEX5pd+9oP813Z7eoegLYM7Hl4oa885/xwynqOsp/f+ZnkLhOu6+FPo3vu8LI9CS3woC9JFHWx
	Vpf4lXmvquqzewQgHAdrpWlg6CYqCoRrpcQ+tjZnAtV9nUIqyAEwkPsdUAt0WKj/w
X-Gm-Gg: AeBDieue/c87PBjkAd8j5cNeKKOeUr7EyMpcTbZwcq6iAJBw1NPvn0nF6peKYz1jNVk
	LRIZ9vPgkEU1Ln9CnU6EqZDEPu5TvozVeVFTgsEZ5D3YkR1O/4heTAFmAlHRzlK0NcCjwZ0YeEJ
	K+u67IseIbBRqFqtJV0tHIvJUdGbV3p4JPoUT65Vr4IcsHIKOXXAGuKpc6H5wIwSwVNmrQlrq2U
	2PQfFEz18Mg2YiAr3AwV40piVanYAr6JOLdcjB8N/TqFkyCoB7oP4wuCMQJTV2IzzXkFr5vtRtY
	cfOXuRpVsNMnF6toN1kfDXX0LEv8t215Ka0+2RJ/73ZFhBRYyjCyufx+hsXsS3hr/FyC9ml/Kjb
	wVv4PjtHMzSOEO9XbOAHySRESvCbQ1GjkmECfKET9a0cKXuL35J9p2ng2TU7OOq3qgXLt768p1A
	dWvK0eWsJdCS/glQBIlSE/dnXU5ouVNBn2ZgY=
X-Received: by 2002:a05:622a:a916:b0:50d:7f66:dca with SMTP id d75a77b69052e-50dd5baab7amr132336611cf.33.1776015152945;
        Sun, 12 Apr 2026 10:32:32 -0700 (PDT)
X-Received: by 2002:a05:622a:a916:b0:50d:7f66:dca with SMTP id d75a77b69052e-50dd5baab7amr132336171cf.33.1776015152423;
        Sun, 12 Apr 2026 10:32:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e49a4a6f9sm17585231fa.31.2026.04.12.10.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 10:32:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 0/2] drm/panel: simple: add Waveshare LCD panels
Date: Sun, 12 Apr 2026 20:32:23 +0300
Message-Id: <20260412-ws-lcd-v3-0-db22c2631828@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACfX22kC/22NywrCMBREf6VkbUoebXys/A9xkZc20jaa20al9
 N9NKoigm4EDc2YmBDY4C2hXTCjY6MD5PgFfFUg3sj9b7ExixAgThHOC74BbbbAStSZc11LTNUr
 la7An91iGDsc3w6guVg/Zzo3GweDDc3mKNPd+RiPFBHOy3fBKVjwd7D1AeRtlq33XlSlQ3o7s2
 6YfmyVbUmmM4EpYJf7Y8zy/AFBPf0XzAAAA
X-Change-ID: 20260330-ws-lcd-b65c03c5ac17
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Joseph Guo <qijian.guo@nxp.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1473;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Soqo5q+LEfVr+3Noi1uaWeIlz7pyLr4dy0IKkD7AqHE=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+bt6zq7/UTqzgV2/J6iFlnbKq5kUbN0ddLSH0XR7S9O7
 1wd9NSmk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATWR/H/j+H415CY6kKg7rZ
 rMRV667stnqlHp0pGuTlW1Rqzam6ONQvuyb2zXXX2mkXXllvvHeqX8lEa+vOiis/Ns58yFgV4ST
 PmcS6RHZNnMPDE69uyTDYdhw6piTgZnvV+9uvd3k7l3FsKFWZ8Nlg10qm+Unr2J+ezdG6WCbu/d
 eLdceB+XVhMbyRLjFdoolfdhWkRRV3c08zKmRn+77F5TWfik1wxL5nXA7nhPo3TNwiKT9LIvZaY
 clvC6UF8uG9y81+TuphcpqY5zbZYlmW1sOC3sb8RUwrdH8qqQuXlIU3uU1Rkf9oNsdB+dTBLbe6
 E2ttMudsYrZbeq07iIehxOmCQfpB4c8TdBX2X2rftN4aAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE3MSBTYWx0ZWRfXwBp0ZqqPQ2Ew
 ET6hxr+bEWFvonwxDSQjYyjtAAjlyWuH+Fkw8FB0DXW+B/FfzjEHgfgWxXGpINs0z3iSEhxf46r
 FgUDbJrZPalDJinMPmUeJjEjFLofwUnI+T5mPBdC2uiIUAHdUeA90EoX098/5KUoZ9zx+uLPNEC
 Iamj4jU2LaJQO5faAPuN0zIa5PLaz+QxKE87f4zctlpyZCz2DhcI4sB0p29/mBVHtKf7GQsTWJe
 SaGabXYE25TMJ9H9fXELLEzwbSilXnqKDyt/l81VVoMo8UMfktpwNm9j4caINnqxAzk+QPnIP9C
 0wD/p0LwvFBmPrPTgzFFP7Gxu0FLS5mnuMSPHQbjYs3f+Q4mFXdbsLu4JnITEF4CozT4slYelMG
 BMXB+vUJmWjuk03p4Hhw/NY6QVWtCvizkYtsdn6YmZ2LZHVCIW+LlRgIjf0tvjQ6o774SgzMSBO
 dRYcJgbC8kmNO1yzRAA==
X-Proofpoint-GUID: uFm_n_egB2S-mUeAx9O5kxHt5jclM2KO
X-Authority-Analysis: v=2.4 cv=MqliLWae c=1 sm=1 tr=0 ts=69dbd731 cx=c_pps
 a=zwWbXilFUbXn88m9aJbCnw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=i7sjGvRSvCxcs841hgwA:9 a=QEXdDO2ut3YA:10
 a=t-zOcvtzNAFHAFCEYl37:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: uFm_n_egB2S-mUeAx9O5kxHt5jclM2KO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120171

Waveshare have a serie of DSI panel kits with the DPI or LVDS panel
being attached to the DSI2DPI or DSI2LVDS bridge. Commit 80b0eb11f8e0
("dt-bindings: display: panel: Add waveshare DPI panel support")
described two of them in the bindings and commit 46be11b678e0
("drm/panel: simple: Add Waveshare 13.3" panel support") added
definitions for one of those panels. Add support for the rest of them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Rebased on drm-misc-next, dropping applied patches
- Link to v2: https://patch.msgid.link/20260331-ws-lcd-v2-0-a1add63b6eb6@oss.qualcomm.com

Changes in v2:
- Updated waveshare,dsi2dpi schema to implicitly mention LVDS
  (Krzysztof)
- Updated commit message to explain why the ICN6202 / ICN6211 bridges
  are not a part of the DT bindings.
- Link to v1: https://patch.msgid.link/20260330-ws-lcd-v1-0-309834a435c0@oss.qualcomm.com

---
Dmitry Baryshkov (2):
      dt-bindings: display: waveshare,dsp2dpi: describe DSI2LVDS setup
      drm/bridge: waveshare-dsi: support DSI LCD kits with LVDS panels

 .../devicetree/bindings/display/bridge/waveshare,dsi2dpi.yaml    | 9 ++++++---
 drivers/gpu/drm/bridge/waveshare-dsi.c                           | 5 +++--
 2 files changed, 9 insertions(+), 5 deletions(-)
---
base-commit: efcd474ed273ae7da614b30e798651c6d57d3109
change-id: 20260330-ws-lcd-b65c03c5ac17

Best regards,
--  
With best wishes
Dmitry

