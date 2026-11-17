Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923307;
	b=yq+swgoCgJbwGNAIORIKrsOHx8rau/eputndMA2hrokkBWY36SPnM4+vQn0ET9nHCoF4
	 XMFno3RODF0E8yLmDXaewPXEWKHO+Or8IHQzx6WhsGBEQKsDrpgk/NFi+IpsBUsu+IyN7
	 HDTxhDfBXMRCFz6mb0goIn0FogL2lwlyJrnM35rz08kC6Ri8Ult0GOXNURDCEE3VTun7K
	 Fp4vnFmMCdmCTs+xpjcfAbOEVYJZFVg4LcwaWk2/ny0/V2oVSqc7RFrryQMr3buE/Lt4Q
	 Tt2Ofn1UJ4xVMhCkCVWp1Q7HAxZMXU/4ze0xNsjvk4HcHhtWXxy1OCNSyTCX9ys9QFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923307;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GE31aG73uaCXMFbWUeiAs+bBtV2hTyeB/8Pr5Ulpk/s=;
	b=dT7eOYnboIViu7tWdmnWWmnxOPzJ6TVlthVae7pFTC6jYFeqe2dc1gfhcxr2nmAo6526
	 Obpfk+qGoZMiWNZWi/4WD8yWnqs0n0Ke4XXhA1DvXa6gy29DNpBOfZGpOSnKOp3Lf32zi
	 KoZQSl9KQ5CRT99gmbzsqj/FVPK/2AM6tbBHY/3a8tNMGMqdGGo/5BxnEI0JiigLIsB5s
	 BEQqhFQ4Vzgrns9eCpn6QiMvBqm6JaM3Xzs3YVidK2A46c1IfSDHrSzWjeac4u2tyEU5j
	 XdUq7cHorO7HPq507inUSwKzmy4i7VpF7wAblfmLr5CUyhPo1ZZbKuEaUPQoxn5Jkng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ny6+YOyO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GUbWOVkR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E746F606A32C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E746F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ny6+YOyO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GUbWOVkR
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC0qS91208459
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GE31aG73uaCXMFbWUeiAs+
	bBtV2hTyeB/8Pr5Ulpk/s=; b=ny6+YOyOmQRpg7+p82AWNdoebYDreSTHBLzHH+
	XBmJ9FcOb5eDQrxxzbbDAcwzcfdKb//HdqTfFL0vCnh34KWzjPXj0sMfJwEPzCEU
	h1c1I0eSmILURb5sJHHQnTyvntY6fxCGndqPppdZh7u0TLgrGbTicCmORRo8RfbT
	TTtgtWSXiKyC8WMhevCBmBPhtLo9PqLUpQeeDlXoNSY8+wQEXmsrLa3NTEkGuZ5k
	P9YMSW/oEVoKK1swvVP6riwZj4DduOxfNEFSifLDAO0/kTV/uW9WIyQt1V6vZ5QW
	JUjpwNMDCdflNlp2S0oslQrXQW3Zq+QgmV/YskEB6AqxYohw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0kcc97jc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:48:25 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-14373747468so2170962c88.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 05:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794923305; x=1795528105; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GE31aG73uaCXMFbWUeiAs+bBtV2hTyeB/8Pr5Ulpk/s=;
        b=GUbWOVkR793tbUqpeiHeEOsb8xPFuaDHP/X190SY5m+G+0QtRugJv0zcyIgADXK0Jx
         MhodeGUhgQaRiqcyhvoeGOQ3Q1BgeZD9JHo5OSODRJ4VqSSrfLhVQh24QWwSoE090K4Y
         /aRJ+gY9xMIFTI/LnQGeFtE838laA3qhz24FWfxQOhoIRf3oqCsRSmwOQ+jVZegNsiMc
         qqPHleRuzDXRLKE4/sXRCE6ulYH5jOewsBl/+Pq3WUuewf9H2icDxBnY++FD5qc39cNJ
         w1+6+/ZnV3UOx5SmU0bVfN8YRz5wcQ+gLiUDKr4NQP5mZQlJ+cLEh+0OdRuk2wbC4rBH
         IvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794923305; x=1795528105;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GE31aG73uaCXMFbWUeiAs+bBtV2hTyeB/8Pr5Ulpk/s=;
        b=J6XoYqfifxEEFdYlI9G86uwEiMqsufTAAn7GO1PygiY73pp5D1H8/WMiGmWIngl3CM
         pyK6XAeE1BhoogykAF0kqzPpp8mXLvVs9YUV92bJ7yeNGr6Nr308MtXOZlX3Masixovs
         BGwxgvDa8TV+isWBoKOuP8pJbfq4Xpyi8iiuMRq4Vo16O0UWNE2Ucs79dN2TPP7tJFY/
         8Yvm6lPiI4GsmWdeZXTLT9fdEVQ2s7joTnGwdg/nISTksMf8skwAX1v3hkEZivH+JMrA
         MxJ/0DxoX+33piKeFPcW7x7Pp5PxMRz9HvEyZIbEGgx/CiGbLyJvmw5qo5hcY8aHrayJ
         ZfOA==
X-Forwarded-Encrypted: i=1; AL+hErGfWxolpo9MvIec28CIN90ZdsrxP4SIWCz9XBL/0jSRghFwMqvvUkkTIxYJirlF+V2HongYDvCaUfvM@vger.kernel.org
X-Gm-Message-State: APuU4Z9kdgAuA9cKJT2qod5uW+mqIWYqpWUV601fAj+q4MI7eecyZsbA
	47Oze/zdf3gKaPke0f1GdT/VMro1lOJi2oya8iYt3zNXmf6JrhEaSAMpSDaZ/PaeQsfr7NE+7ac
	i/cENYQkO5PtlwoAVs0klUoHCUE+yrMMD+GY+FSghC+O+FW6F/16AbJXmtjseOQC6
X-Gm-Gg: AYBFou0ofdsFDN31Sbi5KlGVf5zwk7KUd/Pr52cK8ZjecLwAMtNyNJ9e8CHsHXwDxF0
	op2OKf2Ws4nXd8dnJoXfHXP2FJjlvcpCb6Miy/W7kLjlqlTlHghQiiJePOoRdPIR9ql8L00XeOS
	PZhMx5Eugj0lVZeMemYI4OO77JcdPUcZEOozI+nn6Xl2akXCI/qpcHeo4HLrOqfQWnIFFWMc8Mc
	avaQfOUz7XlnOm8/FfNvTGNBM9Ndzwyl19F3MCY5y4RnOZhjCMoVtE4/N9dPLiwQRyhWPTpeFCr
	C2HjcYFAfQPezT3GVW4osNi4IfqX9jmhhuKBhwhiDPzuWzwYaLB3yEmugW4+3Rld0l/wOCUzX9V
	MSf5zLuqVdpogsvT5AT5+IPuIOtIkjHE49aXsRnZG0LjN3o4IPOX2J1/bHuIuxJdgj0faZ60uvc
	aBiQ==
X-Received: by 2002:a05:7022:1308:b0:143:2968:564c with SMTP id a92af1059eb24-1b5030b613cmr11789295c88.26.1794923304661;
        Tue, 17 Nov 2026 05:48:24 -0800 (PST)
X-Received: by 2002:a05:7022:1308:b0:143:2968:564c with SMTP id a92af1059eb24-1b5030b613cmr11789259c88.26.1794923303986;
        Tue, 17 Nov 2026 05:48:23 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319d40asm42336788c88.11.2026.11.17.05.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:48:23 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
Subject: [PATCH 0/2] usb: typec: ucsi_ccg: Add CC orientation-gpios support
Date: Tue, 17 Nov 2026 19:18:04 +0530
Message-Id: <20261117-ucsi-ccg-cc-orientation-v1-0-a0fb052c7fcd@qti.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIABRb/GoC/x3MMQqAMAyF4atIZgOmYgWvIg6SxpqlSqsiiHc3O
 LzhH773QJGsUmCoHshyadEtWVBdAa9zioIarME1zhNRjycXReZow81oOubDDHJoxTmS4NsOTO9
 ZFr3/53F63w+ABvoYaQAAAA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Akash Kumar <akakum@qti.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfXzIxaPi+ydm7A
 MgVnYGdr7KM89Y68kscK5HGA0kp14Con91M0BscHUj/KpHJn3C5LhUUTDTSg6wigqGLpCJNThJb
 fcHsexdiXtEoFfQSSbAblcdzkewUukQ=
X-Proofpoint-ORIG-GUID: 6lVfZzgvb8EQAeGGJL4qDzF5ddatv_4D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX0X3/3fqQMZKy
 a0nHmyGdDi/ihF46BDoy4D67wfL1MgVSKtuGMApJBBNUPww8kQ3jev7u0+hOuAHEYs06jqUHVaS
 5qVWg1DID4iUAX36yCsQunUnx9EvDUpYNcS7xbzgaG7EJ4XfB1ScyKz4GFje3Hy7HQv3RLcqMQy
 xnCDuHOizAI9PyCoDvI8AAb334WnB6ZdkhitB/v2uSys2QqDK3L0aRfNi2QKghR2rEJxet5fu63
 QiWayRrtFDgnPq0HRKF1OBQ35cOnMArcjoU3q7QUFa+ZF+/1DrJ75by6ZFDsbR3lH2M/MOqCmuJ
 mbELcIV8aQOQm8RSpH/Azcpf9VFaVHE7lGp4gNchDCaVWgTWXTFY1wUVM4Mh7JSGx3EkaNbHe+D
 9BYNRoV2dRhmOpRzZl1nNmXfMMt7PoXuGmFpt3efDrRRtXJ+LKbv+Zt4pTQDLwK5N02v0pZDQKN
 syRT8IpHfDT/vebrRQQ==
X-Proofpoint-GUID: 6lVfZzgvb8EQAeGGJL4qDzF5ddatv_4D
X-Authority-Analysis: v=2.4 cv=ZP1CCn7b c=1 sm=1 tr=0 ts=6afc5b29 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=OciRnzNh6Tf4It2_ZlUA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170054

The CCGx Type-C PD controller has no HPI register exposing CC
polarity, so UCSI status alone cannot tell the typec class which way
a connector is plugged in. This series adds an optional
orientation-gpios property so boards that wire a board-level
CC-orientation sense line to the connector can still report
orientation through typec_set_orientation().

Patch 1 documents the new orientation-gpios property on
cypress,cypd4226.yaml, ordered by connector number (an entry may be
left as <0> for connectors with no sense line).

Patch 2 wires it up in ucsi_ccg: acquire an optional GPIO per
connector in probe(), indexed by the connector's reg property, and
use it from new update_connector/connector_status UCSI ops to set
typec_cap.orientation_aware and drive typec_set_orientation().

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
Akash Kumar (2):
      dt-bindings: usb: cypress,cypd4226: Add orientation-gpios property
      usb: typec: ucsi_ccg: Add CC orientation sensing via GPIO

 .../devicetree/bindings/usb/cypress,cypd4226.yaml  | 10 +++
 drivers/usb/typec/ucsi/ucsi_ccg.c                  | 76 +++++++++++++++++++++-
 2 files changed, 85 insertions(+), 1 deletion(-)
---
base-commit: 2c46a57079874df3a60770278f08404f5d0f782d
change-id: 20261117-ucsi-ccg-cc-orientation-cd3e221ed635

Best regards,
-- 
Akash Kumar <akakum@qti.qualcomm.com>

