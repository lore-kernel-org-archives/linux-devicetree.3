Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793679506;
	b=cfjKgHDX1F6bx/9Qim0Eu1VJmcjZt+J5FpNkRQg7nmK9iZUEPnPsr5/JIDGvwolvZHQx
	 +fTsvdED69DC1vSy9KllzOuiYSpIcSKejrWOPx/U9FKpzEBEv1/z1+yMDQ4XoT95CfaaK
	 RoLxBk2JBHNpsCJUBHKrNdE9kI8HS3P2krpV5vhlIQRyvyNkLULTmOE12xebK1/NwHfSS
	 PtNgiCQLhe14RXdSmucnntz1v2X3QN8vmT88zI01D2T8C9HCWevRSMJ/kKnhu5ll0o7DO
	 yklFfqL7v281s8U9wtAtj8jmlVKYUFA92QUeQe/fiqYJMf4kJ0l+Xj4Thzs9pnbb/jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793679506;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tgjhSVpsh7WmEgcUKf9hKk4F8PjwpzgwqUXXPzT37bk=;
	b=Je3q3gm0YmlNzP61d19oPO87ipd70CDzITNqcb7Qo0ozY+9pRjyUOSnJYO4eIVu3ayB4
	 7b7LOpwTV2ynbO6PpepQF8i54BpM4LpnPWx3s/fRnlHwgXLKqjZnljmWhbKIbtGru12qY
	 8To6XJUjVpx9Hjg2M2hq5E6zICVNhjpfYfwSUEt6tf1PzwcjmpvxOfLkry+8HZ2S22Xfm
	 8Ym/gpZ8EhqOvG1A0rkL/v1g5vzVr43neiIx9TpdAFnHz/vEJfi6JfXwIw8SflGfuNxru
	 w9bTMzJY16dms2Yu9mJGP7xo9Gdx6HuYoZ9sIQhOzfrAAVycI+V9AROxHtFmibUCDEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MXyOblNy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HyMMpSVy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A241A606A327
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 04:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A241A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MXyOblNy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HyMMpSVy
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A33hrOt1141745
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 04:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tgjhSVpsh7WmEgcUKf9hKk4F8PjwpzgwqUX
	XPzT37bk=; b=MXyOblNyivzlhhDaxvbxapLabSSW4APLlwmdNnz60zphknHtWXP
	lEb/nG2i3qBSUuXwAO2cZc4GR4V7fvp28HvGBgsnQN7mVTdYh9qX6uOyFZOaK0hq
	fUsbpufi1B0TSIbS2+nwW3mALKaUO+P5iYbE5Yp7drdjcYOJKMnUrDFAN2cga4R3
	eeKk5vD3y+t1Tn91U1cqtOiQ3RktCSBm9uF1BjZCpiqiUxKqvf0X+F7ZTQbLelSH
	VgSVgAZCzRRIb8xospDrFES1BH5jzU3kIgNuz6Ctlu+vLsVNMj9XS1qpLJp03wd5
	/bLOo4cBVPd3fVdReK1qs06V9x5iWhWWB6g==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq7ycr4f6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 04:18:24 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1acbaf81bebso396595c88.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 20:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793679504; x=1794284304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tgjhSVpsh7WmEgcUKf9hKk4F8PjwpzgwqUXXPzT37bk=;
        b=HyMMpSVyg6Z3t9AbJhOBDrYyfvr4zpQ6+lOyk2aB3EFXA2jc+VoP0LDE6h/L2P0zZ7
         fpl7gkcuvUWYxpdPg2Qrw/eMsBx2YJSUVZy1+OXhuJmyhsSoghBswM/iNbOA5QPIzXvT
         Q3FK70D+TTbydiImusKCsAkdhBdHzUw3WHu3mgvUeNDV9YnH7AWSNKKiaKDEeaOWKRq5
         xGRjr3P4s7sctXuJIWgCwY1FhNiDT3ESC6Le0ZXlBnx06QeMlo5w6YCwse8f74YjfM0q
         xING7YImd6/tOaaTssMBRnY1700tIS32BiPHcepy/fQ8P9BIMRt4kqoU31lv+reHgYZ0
         H55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793679504; x=1794284304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tgjhSVpsh7WmEgcUKf9hKk4F8PjwpzgwqUXXPzT37bk=;
        b=YZliPm14x3s0EzsdBO/CO9Bw9cM/CXV9nMgFxRVbS1eoo4WfIC8OYtjTGtgL7lsjJz
         VynqVd9vCThZPdc5qL9UMdnDSsREXrn7djS3MU1WSDjp7e4YiB9PsQXL7mu8dmMVZjdY
         zQ3CNOqR7b2b/NwXApzNE4D/5v5nvar5x4WhVmjbzMjq/osKQdqchup7/ENHhpIQukTI
         HldmjR5XtuCJN/L4g7xvOdW2MRZyCahzMEaiH0569B/ypemB7Ot1/W+xk09dYv6STFsC
         Y/eV6+9t4ACmU5O82CjZMAPM7blgusbuibmsUp8orRgNVHZ0Tcaz5H4+FTL6NJx8n7it
         CWiA==
X-Forwarded-Encrypted: i=1; AKwUvByvM1LfUP/yv4nZ4aXXDn8HPEofbDtWF0PEVwfscxvnLXpA27FPAeOtpx1tr8ahZ7tPuOZPTQVCjill@vger.kernel.org
X-Gm-Message-State: AFq9FYK9pIRSM70IKwSWifcpG+hU0a9oyG2RpSPmVA5fHsOh4Ex43/UE
	P9BuK45KTg/KlnhbRe2yBddxMlG/w634Jef7twRSqaEWaR/aKd2qLiz8pl1QJxDwlyjc4gpkH/t
	f6WxgMPQ/pNjCzAlQQyvXCWGQaLeu65O7eLMd6IXlxYcqpZHVmvTTZ8EI5Rs65ITU
X-Gm-Gg: AYBFou3er7SRWkRF5Jn5ZUmJ7D9XkeJG4EzoDMoAYJb3g0fBieVkqZRQhLNUoYeHM4F
	zvPcLT/uImMcGNcTMnnmtOWzH+olF6HQv9zSUZQxhLsf16avJcrwYuO/b/31U5EeLJgk8abGUUa
	DRFK7y6NQAWnbQ/iiOK3kLizqFySwBBdgsnNWwh81S7vH1dNkroWCXtIZOjMRTmg33wQ7xXTwMF
	032DbJ8GIFexOnzyzK4cj4rFmUKA9imoo1I+pBliPmxW1aFTn94m1OJiMRSxNzy9JFMKERfKRTl
	TlMupDW3S9faG7FtGLWyGtYi8dNC0/ep5xU3dLNiQHFmjR0SHbDrUInSpwH8kgMRhvqMtIfUe20
	a/l3zhe0TIb19ObdmJ/VGjgqLQoHiNpNelasWpvbjMf4nkiwogjMMs9vU8d6ObZFJuxwOLXLT4d
	roadRLAiYAMy1WWznrI/aRDHYNkVwbW2Tk
X-Received: by 2002:a05:701b:424a:20b0:148:302e:1bed with SMTP id a92af1059eb24-1ac5e8df484mr16586699c88.38.1793679504084;
        Mon, 02 Nov 2026 20:18:24 -0800 (PST)
X-Received: by 2002:a05:701b:424a:20b0:148:302e:1bed with SMTP id a92af1059eb24-1ac5e8df484mr16586653c88.38.1793679503305;
        Mon, 02 Nov 2026 20:18:23 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm21701617c88.9.2026.11.02.20.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:18:22 -0800 (PST)
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
Subject: [PATCH v5 0/2] usb: typec: Add onsemi FUSB15201 support
Date: Tue,  3 Nov 2026 12:18:04 +0800
Message-ID: <20261103041806.1885974-1-shengchao.guo@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=V7foQuni c=1 sm=1 tr=0 ts=6ae96090 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=R9LytnawintqPorzxAkA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: WHHkA17YG6THjOtJRL24wIOswldXBWa5
X-Proofpoint-GUID: WHHkA17YG6THjOtJRL24wIOswldXBWa5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAxNiBTYWx0ZWRfX+ITYTynAAyuG
 4hN/KGBSqBLm9UV5ghho+Poylus5smwyyUYjm1KghB6an6Ea0FQl1aoHT6+q8zfgrRK0Vk6jMcK
 tnXLPUC27VqsHSkXu/8vqHsjTR6S7p+N7seG+bh1uYpAkAdg3kMO96WwUJA4OT0lQ1ZRCV5kOPo
 yr4ESsd9I3zWMhKZYs/Z1khkFjBaLSWK88vp913ShWv2WDUaZYNeNdmpID9UMtshGGtn5Pi9pdG
 oBIgYeoYTHsSiljX8qZ+jKwQqpoVQaoeUHVFJjdOvsQg0Jtn5UJfu//MFbVSbZXGDTGJx39maJy
 W1QsU63oP63Vm0mIlJINI+KliOklNfBfDJQQsjwkKjOoBtXl5KBsXcdRpRZfACiOid0s6vU82lX
 Tab/O1o01+XPhMBwmI5cCSbjSEemEIxtnS+sWRDvgvWnBpzAhk5fr0sebK7SC42GSq49bxF3qNC
 usjFl5/ybxqLVKcYVPg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAxNiBTYWx0ZWRfX1iZWWqllsmAk
 n3cCUmM6nLEtfwbNg5WUE5P+ejFoVoM+VVEZh3jNCvLDizosZ+XaCzb6VxNWbt4pU3gyVizAaJ8
 HSEZiCDLk/awXyh2L/pFETjUoMHmrA4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030016

The series adds a driver/binding for onsemi FUSB15201 which can be found
on Qualcomm Nord reference design boards as a dual-port USB Type-C
controller.

Changes for v5:
- Hold chip->lock while seeding the initial port state in
  fusb15201_hw_init(), so a data_role or power_role write arriving
  while the port is being registered cannot fail with -ENOTCONN. (Sashiko)
- Link to v4: https://lore.kernel.org/all/20261102111732.1678646-1-shengchao.guo@oss.qualcomm.com/

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
 drivers/usb/typec/fusb15201.c                 | 586 ++++++++++++++++++
 4 files changed, 756 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml
 create mode 100644 drivers/usb/typec/fusb15201.c

-- 
2.43.0

