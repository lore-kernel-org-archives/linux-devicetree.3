Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C8D32F748
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 11:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778497344; cv=none; b=WBXrGXKMdurjudvWZXmoieP21F2MVEf8zNjpYRyOt4G1iEouDahD3SG29luV0bsRCJWP1C56FKRyo082GUb+sA0r9BB+IRXHH8b/pfoeBxQM0aigf1XXmPI+Q+GDtVeInGhBVZ76tTKlEgt38UKgGMFjuAq8V722cNTtQKqh0+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778497344; c=relaxed/simple;
	bh=tTNXMZH6Ae+7u/TjfyIMvdzqq0hdS/+lhtAgJD0DOPU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hRHsNzYWNbf0lZzMeaOUA1sxBqgdpYQpZnPC53ELc5rh06i6MbaSaj9JcWUM3G5MFLNalAcUslkEAJLPYplObJly0+DSWDUMXANLPOa1IVkzOBxlYmt7w+aDYPD9cbQM1Anc+VPSiP6mNjeqPLwXkyjP8KHdcGBGjyI6LC6YNDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AvffCpGg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ecIivv33; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AvffCpGg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ecIivv33"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7A4Tp1258466
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 11:02:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yMmxsHM6Uj0ezvVVKE35kNxfWzaw7YGLP+g
	ykgxHWXQ=; b=AvffCpGgIyC4GPNB+NsO/7GqsYPjpKtpaDnvWyzJsXXHU2V8MVj
	u6NJiopbN8d3rn3Pb6mZpErVt4hulbzaPob2+Ymgc8YGqXgJEqcLkbee1Q0N5nVB
	sC30wU8p5ypVBbJYDhfJgcsR1x5VBgpcBiQzHdSHJdVymSXEUcaxfWKiAs69oHD1
	uX9NcKp5YleHe2O1D4Z+SelyRvlYkQomvH7elqgnbYR/f9QysOUF0yLK/1qpU0B8
	OyO+dgirOSmkA2rJEyWMZlKcUs84puxBy/zHCWYSBjiLNWTxnjGAJA1zEFiyOsgm
	ZqBquMHFEUKk4AWBf7zjTG1ugAxSibri8aQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ag20uc4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 11:02:21 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6961bdde2a1so8207417eaf.2
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 04:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778497341; x=1779102141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yMmxsHM6Uj0ezvVVKE35kNxfWzaw7YGLP+gykgxHWXQ=;
        b=ecIivv33XunAofNSIxlBPAvQfTP4eukYK7c0Ai99cmduzWuqtU4tSqMqoJ7De6lae3
         2lzHVHgwLDgvcbFLtGfbXnBuaoB5GojP0OU3nzIM5uWu/cPrcrsdBqyQCCjTAoKnPLxw
         1HXWxKJIjKgfdHswfTYrS5lXzFZt6EZEXxAsjdm3jucjp2rvbvIzytsXwQlz11Ron39A
         8DT6+UO0m3wkAljBNSJtGvpaHnbqbV5qo4WZ+TTSDRHBJW4s/HpoFj0rYWsl8KMfQQZm
         RhIp1KK7Zi3adUhqxBRQgaAq1aiQlz0/Ie+Il4aPP4zFZ0IAtBs+cvgS5O/CjfWzF7BD
         WxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497341; x=1779102141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMmxsHM6Uj0ezvVVKE35kNxfWzaw7YGLP+gykgxHWXQ=;
        b=oacFtkOog82Kv55a6oKcCJLpRHhA3scoNwfrgTMHo78uEeCQCW1oeYmA5kR3eRg6Fa
         q3q5GNZv5EQsz/6af2M9TyPUY/hfTTMP/B1m1DEsz4ottHnT7dzgi+ComloIpaWyxNaU
         cJnJCHpdOsXh4+Gv1yAEJTXEUqHVtuJ9wrEtNq8YYdqn/j8b591gIUdBIi0clCYAYb7m
         LT6lOtuSaA777cQfoDtanpp4a5lrktqUQoEuKJzw1NGxadRkDoSDYfhIYJC30iE/8RSI
         0K1slsLTGN00Etq49sMblig5hTHQZRsXIBQ9ks+N28c5wlMoy7oUPb/HBcxcCmpoTjjD
         QcPA==
X-Forwarded-Encrypted: i=1; AFNElJ+NoEyGajlwJtyfox5y+JRm4LpX4IDrf7+hYAM1t3BoZA2VTFYh05mi4TV6QOYFOXNfctpNyZSieMMN@vger.kernel.org
X-Gm-Message-State: AOJu0YwqkWGSBpy6sSv9c0nSIGF7K3/N7QMBfxdLYbUMBPZt/dSnEM0V
	zfDMbyfFkMWGMZEKNpvQGq7t2yoglc9yzpaKNRAHOFQhnXldlYepKTJq0qT1JCwzt25OE1utyL9
	/xLfjUK/TM4q0iqLMrcYX/u/oWLKWjcgxxsI3c4aoi6C4/Obaq38X1TKW1Ki9lUlQ
X-Gm-Gg: Acq92OFolZyszC0tuvEFKF28cHT79huD/cWrMcaSSJcCRzKTyk/C9L0oqLEv/dCiPva
	jpeHQR7N6JJuB7f20hEnM+4rd2gtk4I9MqJwgEa/yXGvBnwhI8M342OEig8xOXObZAzsxx7kCFC
	HnD87/fwNpFAhaNhigWwDzWi8k41MPPKa7+sR3sTpy0LWeZ5YZWMVnBkfGhFmMyYgDn+OE5PWSB
	f+7JVp7eiq6aWlFb9cWKE1xCTQIEWRGzXMtrQMF3Xlgjuesw/MlPaxETvnnsMGRZMcdx9m0/XLj
	Q4+PTeWcJ3NyInG9D8Il4w7GTEW/LtkTo7Dvjzr8wlKvtoRU8umKIkPaFPJKcz8vey4G3/05Gyp
	X2jHl+eIgaGm0PA/gnaCoUsdNbp3te3U2Lm4SI54tTcvcoWEaibNMAkdzVmgR
X-Received: by 2002:a05:6820:160b:b0:694:9a8a:2ce with SMTP id 006d021491bc7-69998c8fed0mr12284337eaf.8.1778497340851;
        Mon, 11 May 2026 04:02:20 -0700 (PDT)
X-Received: by 2002:a05:6820:160b:b0:694:9a8a:2ce with SMTP id 006d021491bc7-69998c8fed0mr12284298eaf.8.1778497340436;
        Mon, 11 May 2026 04:02:20 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:63bd:c2f9:cedb:aa32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6d895781sm109967955e9.0.2026.05.11.04.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:02:19 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        quic_vbadigan@quicinc.com, sherry.sun@nxp.com,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org
Subject: [GIT PULL] Immutable branch between the GPIO and PCI trees for v7.2-rc1
Date: Mon, 11 May 2026 13:02:09 +0200
Message-ID: <20260511110210.46711-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: O0gc8hV5sm-T0BGPukSO0GrYk19KVTzz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEyMiBTYWx0ZWRfXyKTMDHkYt8TY
 khq4juzWtBhuyCZl+4grhzZx0Y0TuDEB6Q+l/3efR1w0qQCC0ES/trLUWeSvv0c7+FYXadUlwSJ
 3MeF7b1r/Wmzi3avx79Qtev30JW+Br1izzMWvMBX2bPy3AoHQvWJezSYVqrlQltimvv8HTG1Y5Q
 RNTNXbj/YOcKjMfzlRBkN9LgJQUGkRoqw4efCo/Ndi6qmRcYJWm4QEcx/YRoZfrnu0T5lnf/A/Q
 BYEBqXlZIPcg8xHgCHbgWQDRJmhatWuBE4Y5EjFBkoTEAdKPrqMrC4e2d7RXoQainAxOEVMcpnv
 JMOtvDUjILyxHjJsfQgQdiQPrSZnwpMyoVIvnaDS6NDZ7kaW7F7DC4d+Li0RIytlHobjBanNHjT
 EPQYcV8TK7qsdfoKLBANAaoIBNW9/VZuqV78UMSc2Gd6hj1o5QKvAQxrbIKoAt+gzD6WEc9s8pu
 9MFYD6Cgfe5vG1Ha8xg==
X-Proofpoint-GUID: O0gc8hV5sm-T0BGPukSO0GrYk19KVTzz
X-Authority-Analysis: v=2.4 cv=NODlPU6g c=1 sm=1 tr=0 ts=6a01b73d cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=OnGjS8KU5By8L4kgiv0A:9
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110122

From: 

Bjorn,

Please pull the following changeset adding a new helper to the GPIO
consumer API.

Thanks,
Bartosz

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/ib-gpio-add-fwnode-gpiod-get-for-v7.2

for you to fetch changes up to 8a46bd2638f1ad6d1ed73dc3ab10919e67274738:

  gpio: Add fwnode_gpiod_get() helper (2026-05-11 12:57:48 +0200)

----------------------------------------------------------------
Immutable branch between the GPIO and PCI trees for v7.2

- add fwnode_gpiod_get() helper to GPIOLIB

----------------------------------------------------------------
Krishna Chaitanya Chundru (1):
      gpio: Add fwnode_gpiod_get() helper

 include/linux/gpio/consumer.h | 9 +++++++++
 1 file changed, 9 insertions(+)
