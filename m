Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C370E4A4F10
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 18:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789583496; cv=none; b=mePI4JBoqK/8b9a//vDK7DzMpLZ8BaeIE7uMjx+wm5qHALs7O7wZfZWc421zSjE61zrAHbT+cemuBSX5CshK7rBmeNvsof+6S0lvy9P6wIPovNXIj7ROEd/hUeMrCrbBG847HymaO8ZjDfIYebqTe03e09bDXuQghqrkgdVoqJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789583496; c=relaxed/simple;
	bh=6WFqMbsY5MFMYqlgynDA30nN++WrMEHFTWgw/+n3wAE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JHXTqSaHWe9bb2LXXq2sIAFpXu4TbWVoPxbtb0B2R7HTJp6s3SvRKlwa2qymVaoAVw9WLWXSarFetppdpplJ4CCqIICrQODWKLzch1FeJY+g8G/YC3MUkRevH9+gbCF0uSWDFr6kcVkvEYun4oQspkDqJI4N5+TOPCyK0VGSuw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aSfN57Ji; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dfylW4C8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aSfN57Ji";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dfylW4C8"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GH3ftG3897301
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 18:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=v3gvRIGA/yV1xEyOwPDhQD
	5kTkCxuhUGXgr/bqpja1E=; b=aSfN57JiqDov2+LXnLsEHMyU+sKkGGpJyTGWIM
	wITMpOfFoM8endchB5r8vfr9ASRB1lDChTGd+lH9fXKOGHJueQtlipgRmLiR6j6K
	AmNI9/06ACMZ+XesVfMqGjPEZ7TxhKwYve2TXZwtil+gEJwalcUc92yaZxQEsfY+
	9xsXDbA4mylae1TMUd7JTyAXfBKUma0PpbZHNybtvvFqjlGFmyJuwdIxuUXdUOHD
	PzFjABYtj82hJc8c0MWlgd7XrqyzaiQIb/g7YoLv+m20c5GIXmiJGjIZ26iEDhLY
	23t0vhk/lad9/dQmskssFGeIf1aZZplBGBEHIuAzZGrFZq+w==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy6arcgr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 18:31:11 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c990236604so668255e0c.0
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 11:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789583471; x=1790188271; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v3gvRIGA/yV1xEyOwPDhQD5kTkCxuhUGXgr/bqpja1E=;
        b=dfylW4C81qjm5B7KUZKztexiqVptv3oY0yj2uBHAlbSCA/OLy1uIzNxDtGUzX4ay4r
         bo1BphUxCv7vXW8dQ1KDvFPY9ODBN29SWcE41UuJX8LPLGeclC+dXFqsHqbsAP7c3c1j
         rmPtbV20X//NU8trrheqwa2UNOxIJ4mrv8s9ok2oBIMR9wMuFw88qKCLpS2dB5yluuQt
         2dLPOsoB7xtBjl8HDo1aag7ppWeHDpDBk4s9dHftuh7w3G0Hxlu4dWGR2FJYLLYRj6jo
         U44rb7R/RuppXnH7gWLKnlZN15wGIzdD24HfKOVTZgP0QcqcGr1N8mmVkZK8SUwCmrnx
         fCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789583471; x=1790188271;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v3gvRIGA/yV1xEyOwPDhQD5kTkCxuhUGXgr/bqpja1E=;
        b=szptDhUKTYHuty3Ij1Uv/PkOua4FR6LeEPMVFJJ0AtaIAo0mnsI2FJwCtXelsF/R+z
         kwEKr4LElRUdaFfdUzmCrinHSbdcii8fQAbqxIQt5Pyvu8Uo/WLxspI3+Pwf5QbihCHn
         qhg9bGQFgruK/gascWaC9cUznAOKUmmzAWz67s+su+T3+KcrGCrVdJJ8PtT3VP9Pjr9y
         h9Byq1rufMTYqITd2I+cMD36Dk/Jd4C3KWqblxid52xcfqyNpN8e3dhxj9uXT9S7qx8w
         JH77WNnkFcMW4SM3mVCL4X6lopjI2Fe23h4Zg8Ru9iDzYqDB0Oe0eznht8AoZvFy+HPo
         x9Ng==
X-Forwarded-Encrypted: i=1; AKwUvBxxd3P3Lr6xbP/YCwbqLD3pGe7PJ747JVtF6tuyT8m6fYXX632MQ/t7Uz8kP45rE0D+5SUplgwdBjo9@vger.kernel.org
X-Gm-Message-State: AFuF++nTY9w4IHeGyoX1judmc4FmT2ZJHT9QUaKtnbIM+d5FUpjJCKPu
	X6nM/Swbyj8kcSbjv6+w35vqyvP/g62cSeHHmVCHvkEk2VbufrOnQ9iEQPmUevC4vyYFa+iujZk
	KgZ+Mleu7zSOAzjR12wFDk05yEQCDrneYoK35Oyi8NjRG6P4LiiKxzGIA7ObuwBpq
X-Gm-Gg: AYBFou0tgTc0qgaGoLZLGvZF02phw826qXD1udGsFA4KeWTIvgTo7lvhHC/o4HYSjvG
	IpCg5bJmhU1p+rTZLQD7R3jyuR2ULHje+whMT/si7dLDifK0zIDry9sgHSvHyvKpqESQmrKKpkB
	s3iYrs/WamiLtMeES3ACdvkvgVZxu1ViZouO2GyNlBfspEZR9j2FhuXsrkimZA/Qwbf61BSGWCP
	+rBuVBFmlr1TiHiIuWPU/yf8PrYZEM5nItEzc3jcKfdYbWPczXLBTvnOUR2DmTUxDy8nJvthVNH
	sp5FFn8rDiWrvkD6ZljPSGt4cchk86HAi0ExQf++pJH9bmS503nfSVp5HuOe4Vf76wMAL6Q1JPD
	vhlhnDAt40KU69gXn1VXPqy1TBOY=
X-Received: by 2002:a05:6122:4885:b0:5c9:a60b:e5bb with SMTP id 71dfb90a1353d-5c9a60be949mr367277e0c.11.1789583470393;
        Wed, 16 Sep 2026 11:31:10 -0700 (PDT)
X-Received: by 2002:a05:6122:4885:b0:5c9:a60b:e5bb with SMTP id 71dfb90a1353d-5c9a60be949mr367165e0c.11.1789583469801;
        Wed, 16 Sep 2026 11:31:09 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf2797csm8625416f8f.16.2026.09.16.11.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 11:31:08 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/3] phy: qcom: Add USB PHY support for Nord SoC
Date: Wed, 16 Sep 2026 20:30:50 +0200
Message-Id: <20260916-nord-usb-phy-v2-0-2c8461bb30e6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFrgqmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDS0MT3bz8ohTd0uIk3YKMSt0Us5QUY3OzJLMkU2MloJaCotS0zAqwcdG
 xtbUAM0qRwF4AAAA=
X-Change-ID: 20260914-nord-usb-phy-d6dd376b6b53
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1395;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6WFqMbsY5MFMYqlgynDA30nN++WrMEHFTWgw/+n3wAE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqquBfVzBHJbfCqkaO12bk15XeM7ldkyj+DPDmD
 bVq67wgUoqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqrgXwAKCRAFnS7L/zaE
 w/YkEAC7mYA8uMPgtdZSFoRCRwKj2MZ1A+5hLEUA9Ug3b5UGi0lpcHOtTZPG7d6kqRVGSPkED0x
 6iCBgew7V0+835N113sER9CTC+vM722xH329o3Fd50yzItvfqjjGQn/8MJGu4Zm73/8RG8hULsM
 A4axgIXl1qtrv8UkdFS1IIXCu45IyfRUuv0aOwfszZJ5HTT4JuZcDD4IaiNZoa5HvL3Lb1hzhEI
 zp0TjPEqHRyC507DzF+W3VyP/QQ//Dcq00QMa58uZ0TojcML1ZADfGixbgGllEtzf2wIWjKv6P/
 DI7PfSLnLww1dgXE8HvwddyfGzYSHHKPrSXEAGS7cFd/bZS6HMVvVBbvFLP9JklhQsrN72a2WJj
 lz7VB5v4Z3PYB0heIOHgL/aPpcmvyAh8erfPnBzA4iKAacTOYYYiyu5nxVekDFP2w/g7vNVtRi4
 jvqQC1cvOwM5Q1aZnspKarYB23znW4JTZ+1BSWzMOrSTqEICSRZ7AtM2JNFfZ8GWLA0xOb4S5kh
 9KdRZWGev2aGYvVzrPhK8USy393UCTeyupWJTRLFjENNEn/UkGGG66QA7Qr9q6KknF4vLOiUMcP
 iozJUvlnt5mPN78+JIUag36zXLqeT49WhLWsI+mQBH+aXTgo5V2FJoAQFUsotabT8d8dEqaE+0U
 3t0b6AlEYaTSi+A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: kFCnOlMZprGff6-QODHSgcrJ66yX9LXK
X-Proofpoint-ORIG-GUID: kFCnOlMZprGff6-QODHSgcrJ66yX9LXK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDI1NSBTYWx0ZWRfX3KqMY/bn+x6u
 sNd5OfoOo7uv5BKhsh12qUVcYkS1DqfBgb7wGEGuNiu+B4q+dGZR9NIZjUUuWBZXeXo0nVg+QhC
 PP4+fnjzYIEjQ37JMadLC+N+haiWrXu8hKseI7wxvTOvDTcJpKJjNO5m8w+sDVMuHTB66qgmM3C
 P5AHrlI6w86HvAJIiOFKdepY35jtGSSB//xUaeE3cbLSbKiVVZd1Tj2sW9M4PE5TXPPNApc1dLU
 nD8T8yjOsICUdkBa37otBZWuBCx18heDJlMnDSYFVHBOcwB1dISr7cvoFZZgO0pftveJAdM6J7+
 SiGAFQA7Ghp25otOfo/8sQzxc3IEKJA4GPj/y+yB7NrLmN51tHIPOh/Y1sTRFw9wizDn9eIzL4J
 TGxlAvDoE9evMd8pIS5q9qEx7BO0uZ2zSwcoRAKUmiG2+4+kuNmaU2pZZRO+hH/Tcsn2nwvih3C
 gyVSv0UEGMlHx1H47qw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDI1NSBTYWx0ZWRfX/8kUUzGbMXca
 LOW7SPHDA0QPf+13ANrgV2jrXKY3KkeVF0UPv60VHvSz2nm8Wh8ji/KJVWpNH7KdsAHE4HO7i5c
 vLwxGZByA4wMI55Z589uDk8WiUUtC4Q=
X-Authority-Analysis: v=2.4 cv=VIRIDNPX c=1 sm=1 tr=0 ts=6aaae06f cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fYuUhxZzbo174WpB_3cA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160255

The series documents Nord in qcom,snps-eusb2-phy and
qcom,sc8280xp-qmp-usb43dp-phy bindings, updates qmp-combo PHY driver for
Nord SoC support.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Rephrase the commit message in patch 1/4: drop any mentions of the
  driver implementation as it has no impact on the bindings. Clarify
  that usb20 PHY really does not have an external reset.
- Squash patches 1 and 2 for the optional reset change to make sense in
  the context of adding the nord compatible.
- Fix tx_tbl register values for Nord.
- Link to v1: https://lore.kernel.org/all/20260901095055.42229-1-shengchao.guo@oss.qualcomm.com/

---
Bartosz Golaszewski (3):
      dt-bindings: phy: qcom,snps-eusb2-phy: Document the Nord eUSB2 PHY
      dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Document the Nord QMP PHY
      phy: qcom: qmp-combo: Add USB3+DP PHY support for Nord

 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |  2 +
 .../bindings/phy/qcom,snps-eusb2-phy.yaml          |  2 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 80 ++++++++++++++++++++++
 3 files changed, 83 insertions(+), 1 deletion(-)
---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20260914-nord-usb-phy-d6dd376b6b53

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

