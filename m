Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A805438469
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 12:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341895; cv=none; b=Jy75eg87AeXc72AEtSyA5JvWKje4A6i5xmy6kFlkURFdILqLWAHlYv7po3R6xmBdGqkZ8DnQYgp5cBxp80AVLVoNH5jylNS7iADHVCYnKFIZjpLALpb3dxHg4yGyvnBhpIJvLbBL78fG4/ASCgY30x/w71YeqQYx+vEBYxR8ub0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341895; c=relaxed/simple;
	bh=T44HwwZ1Q0M84+szoUbk3kJ64ZYTCT8dJmP8V7D67KU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JULNj8ftBly/OWNdAprZDWORQnyJVq0UZyns0CgbzuWsHdUjtYwyN5G6j/t5iL+zy+x35/5GrkItL+xf4Gr6R+Su/3poP6n9VxtGFG5QbDkvY4SFCg1iCOl6OxbkC7daM3x4eaD6lJ9OEHCZjDywwGXncF88L2/xHyzusSKLC2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HvCI54HI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rv/dLGV0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HvCI54HI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rv/dLGV0"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxFZ6401636
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 12:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7VfOweZR0NvzKfVRW7ae+/
	NW8JVQadN2E/hr03AdQ1s=; b=HvCI54HI6r2WAiPzYc0IXb/+6AOTqyJ2z1Q1Fs
	JNVh0m4mSZDL5o21i+i8bvQetkwOJ9innTRe2tVd0jSJc37bGA8wKzVwiVF7Bsus
	JGoJIYok+3i12s7ZIggCc4wl9NGo4bzR3lL/esbGOCJ8KivTwK6jzC/C+yIq0ptc
	itK7/HcU5/tl+x6Il+4JZw2JWuEe/WCA7wwlxVYvXsRwFcugg3Ha9ESH9WrPuh1A
	7d0ghGcy9nZhbdPx14EYgydrDsLFurGwhz8rQmkCylU0mnNOl87XtCbGrOKFBcW3
	VaMKUx2fmp4AnkeMMXbHq7C2lQVewhebNpZs8Kfu3Jnp69NA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3grkxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 12:44:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e6ed4fe99so509443485a.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 05:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341890; x=1783946690; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7VfOweZR0NvzKfVRW7ae+/NW8JVQadN2E/hr03AdQ1s=;
        b=Rv/dLGV0WULvhdf/N42KB3kaJmx9YhyU5WeEkYj5PeNzPIbW8RDWFeDKMYKtqvg9AK
         BsknjBbWel+R478IkumD5roLIAXY76TwSve27JPJAPo/NHNp899oIfxHdAqu2lw95iQO
         i460UVtZKoJfEliTUwJ0qA6Rv6iqBQot49mrTYsFsP8qsxVeQhNCJW1ttUDRfMQUdMLL
         N88HBtEgShThZq/W2Hi6xn0E/ElSfHuZAgFItSMCxr6Kyl/EtXLfObNmPWxTw93tjV2F
         HwLog3kiTEp0QhwH7dlqJAGqTt1D11P2ZhpqKV/pvBaUzFfMqNhT6JV85Gmba8hvDyc5
         DyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341890; x=1783946690;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7VfOweZR0NvzKfVRW7ae+/NW8JVQadN2E/hr03AdQ1s=;
        b=SssWrsjDe5Zea0owtHmc79fUUSbhCpZjY3iCjrubBAsz9LovYYcf6Q8YcTmZ+Xu8fF
         8NaGJoJWkbb3FqUB1DhtJXaskkAaPn9TETpSW+X3Eu5pAZ3Z+yD8jWkAHErUtGqOH6Mf
         ewGBKSlZJ3723nBjGlWoFQgMYhEH0Ji+NttAYmoWKQINLTIT8t/F/hL+444Ny6HaprDH
         SECwSMpqcj/JBMjP7nYaa+N5NCy9NZWnDsYlX6ICOUjLSrl/Dz3lVVUnR2a1QGG00mGR
         V8Jf5zpgt4HNJejgrsMgrAm7DcgJk5PQsO7iqYTyry7Ik0m2iva1t+kaw27EylHqkChX
         Wg5Q==
X-Forwarded-Encrypted: i=1; AHgh+Rocs4oDYGL3hzsBGv0tlP4ECgQiUwzxaDdZ0qb9x2B5lQRKqGJHdX+KsTpqivP5Bm8Gg7J2BNZE/zPK@vger.kernel.org
X-Gm-Message-State: AOJu0YzWHkJlCv1qpFEzS4JaZQXs4QPGbTnjFbelmudxTuOCHS9TbvCP
	V7IALt86OaHjf50VqQERQ9ep9+uMp1up8PoIbNPuFtKkvinahdhhLL8Prw3opwvRKef68TdiWjv
	ztWzBOTylPEXO8olMbM8+ilkpz/HAS8QzAtM17gSqgF/uWAYFyyz3b1Aiu+E9s80w
X-Gm-Gg: AfdE7ck2n9aUQlCVZs40EdV2MGI+aU7J3/RheiQ3X7uktcmlTF4rUydKqaRiR8JWZWy
	o6dBnCsOlzyDTuCXYkIAcq2EAnVkycXEq6Uyd8sbd2ANSPMHp8PuqK8Ac8prAisArmLZaS95zka
	J5l9cO5hhox06iq62IIyqE584/0NWcmHgCmAE0WVE37sESU2EFImMXMOHgKl7he1fJi6oElAjLu
	ORTLfOS2xSk5DlESTGJQy/BAEQSHiWNllFAMYqdPq7Jou3p/q8LAuhK99gmvxUVwGAnfp+GbOfJ
	TwMwxgLjHcQT4nGaIraySMgnuk5m3LbnTz7uKCay7N02ivYFULLmWQvA2zfjtisT9m+VvTjm3CE
	FbBS0ABieM5noEkKpVBWfxXBBiwzpymAOcP7I3DAC
X-Received: by 2002:a05:620a:2911:b0:92b:81fb:87b7 with SMTP id af79cd13be357-92ebb4a74b1mr50552185a.13.1783341890090;
        Mon, 06 Jul 2026 05:44:50 -0700 (PDT)
X-Received: by 2002:a05:620a:2911:b0:92b:81fb:87b7 with SMTP id af79cd13be357-92ebb4a74b1mr50548185a.13.1783341889592;
        Mon, 06 Jul 2026 05:44:49 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm22126539f8f.31.2026.07.06.05.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:44:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 00/20] driver core: count references of the platform
 device's fwnode, not OF node
Date: Mon, 06 Jul 2026 14:44:12 +0200
Message-Id: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAByjS2oC/23NQQ6CMBAF0KuQri1pp1KKK+9hXBQ6SBOh2GrVE
 O5uITEucDPJ/8l/M5GA3mIgh2wiHqMN1g0piF1Gmk4PF6TWpEyAgWQFMDoajLR9Ds4g9dhSo2S
 phKxKjjVJqzGV9rWKp3PKnQ1359/rg8iX9mvxjRU5ZVSpRsBe81oZOLoQ8ttDXxvX93k6ZCEj/
 BgJ1ZaBhdE1QsFFW0n8w8zz/AGy8k9g/AAAAA==
X-Change-ID: 20260520-pdev-fwnode-ref-d867836971eb
To: Lee Jones <lee@kernel.org>,
        Mark Brown <broonie@opensource.wolfsonmicro.com>,
        Thierry Reding <thierry.reding@avionic-design.de>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Peter Chen <peter.chen@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: brgl@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        mfd@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org, Manuel Ebner <manuelebner@mailbox.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4776;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=T44HwwZ1Q0M84+szoUbk3kJ64ZYTCT8dJmP8V7D67KU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6MoJZpVWXquJPA86qFchcYH7k3Onxk1jGth8
 HC7/Ub3emyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakujKAAKCRAFnS7L/zaE
 w5C6EACRXYySfkJXFyTq8zPf7US9VFpPW3RE274q/2YBjIesYwUF0YvCKdzVceLWeMMeG2J6zDW
 kKPnEeuZJw5iEdAZ/ZBRMOAmEubsTBD4+/6aCpJUokHzGF4atoDvN4qGLBs0yunKGDADXpORe53
 DKH2ZSJAeyeh6m6ApIS2kFEuxPAFgHOGRfJ49oU8HWhghwyrfZAafNM/pnRLdSVbJtjR4bbqJ6Y
 ADMhQbYObhQcUZPL+Pd0/zZ3eceBO5sR75HXI1CpMPtBmnurs5y8ROaFhD1O9fRw5R31AaggXa1
 T2PfA++SCs59XKUD9MZ+sbvqxbKl+eT1YDimp9jxs7EtpTwGbAhWKJQU1dnLAYH2DqJAyABQ2iD
 Jz+z/UKxaEuZta2/BUh9S+ltz05OQNOaGi4dnWyQZTjJOEOAndluZXURrk55+4Th+jZf/hivpZM
 PH3hYGyTBIsWD+3bwfWzc/ywqJmwpgf/lm6De13odOQ+CgbtKNhqj1YiAYm0ycwrxLOwiYpeFAh
 SafUvNI+inETJ5q/MDf2BgXJTLYnwwem1L9HjWvrd+KcxlyXvcNkU2NqjNIS+az2hgs6TyTwLj2
 6nrCsPnQJTSJQyRyLK9DlcWtWmfUmUcgkvKbl/Gtc3sMJFlfIjSQa2osUPg0ZgDKsosfSkNp2al
 Q5/taAz6caNJmuQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: kwbA1eJddAbAnaPsy7F52K2mLUzLLiHk
X-Proofpoint-ORIG-GUID: kwbA1eJddAbAnaPsy7F52K2mLUzLLiHk
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4ba343 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=rL0NY73m5x218zCt0XUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX3fESdWRRdUyW
 +tpylxHquwu50YrVZCyTCb/8R8jo9R7uj9u6WH/DvARD7tn6KUE7VOcnDvEOCt7j5gEt+YUrKnn
 y8V8a9hSkqpsf25SzQZ5CzciYi0zMMxqJt95Hf18T/E8Ry0/tpyGYLsc7qamCkgnnSfRZ5S/QZN
 TPgWrosWHnkDOW1hva/p+4+m8xsAmuiv1/Qnrf8brwBTtfJLEIFrhy39VGPSsmp6reY+Ia2Upqa
 09/BbmZxueGpX2K9lx1zdebYhOSn+qqvbevA3cXik2a5/sYX7NDbMAF0e58m+TQKzSuOifVnr5a
 9W/Gwoi+RkHSZGPDZMimXf2vVDn8cvHDk3IB1P0r+HP6x+HkfRk67ln9JBrUbWWXwcSUP6RH9mS
 +PPEXh9YCqm2lqrdlU50f57DaIC0DcsTWk+C9+oDzndiFEikhrCODuzBTB3Gu6kx83SWQkAioAX
 geRavBM8JS6V8JLgKUQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfXyitp9mYF70eh
 k925YVo4Sr3H6/KB0WmeTqM661caFTHD2h1lxN/wfDCTBZXyiAf8+UVbN5QFXm4r4+VkX/1sAoN
 w9mdhbNM+zxv/SufseOl/h01Ych3fhM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060129

Platform device core provides helper interfaces for dealing with
dynamically created platform devices. Most users should use
platform_device_register_full() which encapsulates most of the
operations but some modules will want to use the split approach of
calling platform_device_alloc() + platform_device_add() separately for
various reasons.

With many platform devices now using dynamic software nodes as their
primary firmware nodes and with the platform device interface being
extended to also better cover the use-cases of secondary software nodes,
I believe it makes sense to switch to counting the references of all
kinds of firmware nodes.

To that end, I identified all users of platform_device_alloc() that also
assign dev.of_node or dev.fwnode manually. I noticed five cases where
the references are not increased as they should (patches 1-5 fix these
users) and provided three new functions in platform_device.h that now
become the preferred interfaces for assigning firmware nodes to dynamic
platform devices (in line with platform_device_add_data(),
platform_device_add_resources(), etc.). The bulk of the patches in this
series are small driver conversions to port all users to going through
the new functions that now encapsulate the refcount logic. With that
done, the final patch seamlessly switches to counting the references of
all firmware node types.

This effort is prerequisite of removing platform_device_release_full()
and unifying the release path for dynamic platform devices using
unmanaged software nodes.

Merging strategy: The entire series should go through the driver core
tree, possibly with an immutable branch provided to solve any potential
conflicts though these are rather unlikely.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v3:
- Use device_set_node() where applicable
- Use __free(device_node) in fsl iommu driver
- Don't use __free() where not really required
- Add a patch updating the kerneldoc for platform_device_alloc()
- Collect more tags
- Link to v2: https://patch.msgid.link/20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com

Changes in v2:
- Rebased on top of v7.2-rc1, dropped applied patches, collected tags
- Link to v1: https://patch.msgid.link/20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com

---
Bartosz Golaszewski (20):
      powerpc/powermac: fix OF node refcount
      driver core: platform: provide platform_device_set_of_node()
      driver core: platform: provide platform_device_set_fwnode()
      driver core: platform: provide platform_device_set_of_node_from_dev()
      driver core: update kerneldoc for platform_device_alloc()
      of: platform: use platform_device_set_of_node()
      powerpc/powermac: use platform_device_set_of_node()
      i2c: pxa-pci: use platform_device_set_of_node()
      iommu/fsl: use platform_device_set_of_node()
      net: bcmgenet: use platform_device_set_of_node()
      pmdomain: imx: use platform_device_set_of_node()
      mfd: tps6586: use platform_device_set_of_node()
      slimbus: qcom-ngd-ctrl: use platform_device_set_of_node()
      net: mv643xx: use platform_device_set_of_node()
      drm/xe/i2c: use platform_device_set_fwnode()
      platform/surface: gpe: use platform_device_set_fwnode()
      usb: chipidea: use platform_device_set_of_node_from_dev()
      usb: musb: use platform_device_set_of_node_from_dev()
      reset: rzg2l: use platform_device_set_of_node_from_dev()
      driver core: platform: count references to all kinds of firmware nodes

 arch/powerpc/platforms/powermac/low_i2c.c    |  2 +-
 drivers/base/platform.c                      | 61 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_i2c.c                  |  2 +-
 drivers/i2c/busses/i2c-pxa-pci.c             |  3 +-
 drivers/iommu/fsl_pamu.c                     | 16 +++-----
 drivers/mfd/tps6586x.c                       |  2 +-
 drivers/net/ethernet/broadcom/genet/bcmmii.c |  3 +-
 drivers/net/ethernet/marvell/mv643xx_eth.c   |  2 +-
 drivers/of/platform.c                        |  2 +-
 drivers/platform/surface/surface_gpe.c       |  2 +-
 drivers/pmdomain/imx/gpc.c                   |  3 +-
 drivers/reset/reset-rzg2l-usbphy-ctrl.c      |  2 +-
 drivers/slimbus/qcom-ngd-ctrl.c              |  2 +-
 drivers/usb/chipidea/core.c                  |  2 +-
 drivers/usb/musb/jz4740.c                    |  2 +-
 include/linux/platform_device.h              |  9 ++++
 16 files changed, 88 insertions(+), 27 deletions(-)
---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260520-pdev-fwnode-ref-d867836971eb

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

