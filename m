Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779701;
	b=Nela7/WPXP7DTasdduTXKkIVttMkzTMlxNCho+Tlom2WefnEwA/G8UfLCffDlhmh2wjW
	 Mv2Y9IuYVonXX0klhyNILvR137RsDA8183FApyDkC9hZ7+fpXXekC+dvTAeYtCNxkZoeC
	 L19PQcWu2xp2T/VNhQYwu99rAs3GokbG2vYrH1w7oM6DASYdKqwNGV7f+j9sbtVyx9FRa
	 tzpxQl9A7OnlF9t++eHSwY0SrtPEBGnrycHHdop2IFgAKkiBXOprkAAaLAm5xBUh0FtEQ
	 WXssPZ+F9qSP16gj15pN/gmyNB5+AqQCuL8z4Q8QKMQJCT7sQ1h54my3b9UyCq58h9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779701;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GZ05oO4YTSpT04Ds9K/avLZv5nZ4BZSN3UPY5ipnDKw=;
	b=eFBPJqjDLLAyBsOF9MDqc4pvkpgQn1DBzAqGE7piBB9fGXOxEzPcScQjhPewk8R52Ulb
	 Ef8oOpV8X9yGxjuUR9x2MGlbim8PvQzZ5LPi/mAqHvD6NdTxpSbqk35n2K4NTQO43Nxnl
	 VIq5VO37D7P/ASgfFlDt3nobtEgzUXloGewamVqZ53HgU0hNIRdQXxfpgkbhTWemjkHcp
	 u0uIALlpuUj3cSLBcuqzJ/mpsCCYeUa1EmFmZ7S8PxomiYoskugaMLIzU7IRnOZ1QHWOH
	 R3liErMSuisP6+gIbVRT2PgKZ6Blx70t0+iJJCqS+7NNz6gkCzEuvUq0QlPQGfB60VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oVDxxVWj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UV6NjaRC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4FB606A33A
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A4FB606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oVDxxVWj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UV6NjaRC
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApYBQ2058109
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GZ05oO4YTSpT04Ds9K/avL
	Zv5nZ4BZSN3UPY5ipnDKw=; b=oVDxxVWjt/7YI1pynIUkqfMVsusntOWqcekg4C
	eGGla5+dNVCQW3DRpPA6FmFx1srIpryCKVH0xfn7NQ8PaWESWaDx+rvskF1MwAuz
	vn6OKQYI3rE/2XucA5D40VlXpnVCH4KGCWNc2Dy224ILMLOVxE3UeSAwr11rYlNP
	AyYEt+10u3p81c/VyOdwON10f/8cbnhYobx3F/Hj6RKbWftKK9mxRkonLT9MK/vn
	oQrURZkOLGCMSmnVClnGHebEYPalCq4eDa2x0vN+U8NRVhnRz6BGKhACH5tvh7U4
	NZhHcIYaimlVyFC9e0pzZmPGsPh/mhxms+hoAVF4l41t1c5A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gas8t8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:41:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94a1db3cd3cso124503685a.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 03:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779699; x=1796384499; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GZ05oO4YTSpT04Ds9K/avLZv5nZ4BZSN3UPY5ipnDKw=;
        b=UV6NjaRCjQgIj2AmzkRdp0SjCOuxw2YFouBeS73E0vrRSxm1YMl1x3LIXIUpAPy7do
         NtwbkkoRKyxfNP/2Vtwa/eC3WvMkMayCFofLyBY221NZtchHu1fF8H3ySmmxSZ2BU24G
         jOxs/oJyvMqDmPNqCL0rbFdD43yJvmsH246f5vtvb9WOWHNNq6NkcWk1ZX3uQPKZsZiv
         XN/oyi7hN7pe3Up0wtAA4NMd8NJ+LXeL6WiWm7NdU4kXkVzlyHP68JM2slxF7E9OHhRm
         1d5pyh2ytc/F+SLhnYSniXP/S/LqBmO2lLrQA6JtgSeXQrBWNfAB67V4FkQDSXYYJt6v
         IOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779699; x=1796384499;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GZ05oO4YTSpT04Ds9K/avLZv5nZ4BZSN3UPY5ipnDKw=;
        b=VfvfaShE5VAhV3kIO0hZ0z2DTplBlJsixLhgs2DhEMQQhctn25G48ALh07PHXGilT+
         nsS1a7atpjG5o+uSvsJKeNkSAL72vXxUDWzTnJMAFWlJ9OsHESkBZrrQA6DBwGJhVQse
         okmHnfDXGK51XiRs8tEVdCAoSnTo4isqVppHHviZxXDytAZotaw/UPHTNUzykAe8EusI
         dhHwLkYvU4nlvZjo7a+zScfW9932l3FM2DtvnSwk65S601ZghMaQKgJDuA7RIuiE+yMM
         DCq+RgSb3mabZMGn452eGzfrIVLxK0LDOZijSEE8mdwKh6QSsvphhpn+T6kh5sMNo8Gw
         XMwA==
X-Forwarded-Encrypted: i=1; AL+hErH7qZu+M3w4FKdw+GUHCfbNcvJYAR/z4Ni9gYrPUEbOMXYtYMkHDq1auB+361hA0F8+4KP+mLX7e2iX@vger.kernel.org
X-Gm-Message-State: APuU4Z9qg+FpviZTeewNRtCGD4UMEuQ43tzWLqfSd8bU4xezcoTPP9CE
	JmaIW+70BYKAU19CFe4T1Z4AnlUDqgKGt490nuE1kCEtxYqWefVFyHxvfvLSnFIi0IXsbml/12J
	jp+gcOu56LKflIw8lEhLtvtbZqWRa8Ouqff4Bs1vW3eGA5bF1QkD5vpELaTgKIaYcgTiAYMk4
X-Gm-Gg: AZFdTZfIfjHddWUlEItrA+fUJg7puLsTAbjXihQiR7qRXmi6aVPt2EXA0jpYDx/giXO
	ploPVTF8Rz8agE0ObXCCpGBOuIdEbWP4cNwICqqGqGKIlkrbAZsGLTwU9WHdJUomk89au06ed4m
	B8fmVsbP6D5XFoHofL2IamOnnigNMiHj0iM4tLNxp9Ior8TP3M+g/uANZES8h+f1U93yGStRWz0
	HL/U4tv1OnV8FoPI2gZtDBwX7m6jZzT2zYG3jh0rJBj96R9YGsfjDG5y9wmHXsl9NmNjEUW4TtV
	NOFXwqNXG0rviNAZmhLJyTwE0bfiIAuiQ4uYhy/fT3kKoVxnouP+iRuv2wfDPhDTw5m3/hbOTCw
	u0oYFFF1ZnT8odJbGhXyEDgtFrdbDPJbIIG9RPxY3Z9PBjd4eqZ+VkRX9bFqKZmksxIK45x39Br
	0spHx86VG3OyicvuzJBx04KZS1O6G4e5pEm/2Teopz7QrbVIk8rLCrNZAQ4Kle6N0=
X-Received: by 2002:a05:620a:199b:b0:947:7857:bb73 with SMTP id af79cd13be357-949bab0ee8emr4421404685a.63.1795779699258;
        Fri, 27 Nov 2026 03:41:39 -0800 (PST)
X-Received: by 2002:a05:620a:199b:b0:947:7857:bb73 with SMTP id af79cd13be357-949bab0ee8emr4421399185a.63.1795779698830;
        Fri, 27 Nov 2026 03:41:38 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm45137049f8f.7.2026.11.27.03.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:41:37 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/6] clk: qcom: add clock drivers for Qualcomm Seca
Date: Fri, 27 Nov 2026 12:41:29 +0100
Message-Id: <20261127-seca-clocks-v1-0-1781298e658b@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAGlsCWsC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyMz3eLU5ETd5Jz85OxiXSOLVBOTFBNTYyMTQyWgjoKi1LTMCrBp0bG
 1tQDB3j4SXQAAAA==
X-Change-ID: 20261126-seca-clocks-28e44d453241
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Tyler Baker <tyler.baker@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1843;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MVKj71IQINUpCIFknUYnCMbOt0BCNz+psO47csbCB4g=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCWxw7IMxd0JvPeN3gybQzd2kn6MD0/Kl8ygGo
 5biI1HyTbKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawlscAAKCRAFnS7L/zaE
 wxybD/91QEsPl9W0Q2ozDzIdYqshSwgdnK2Kx0mFMn/D75AyZq5XzwXWJUYho0mshE49vZP0KCJ
 YZ0U1dvZqffK2rdz0jvuU7GozvUglHJpF/Y5+EcdMj84fvz/GLDJqxEiYrqfa8PYierxmMfCVs0
 8wi7y66FB0VjjgzqoQdXb19KZTQapcPK/IOB9arNn1PmXjtsLOc/tc+rD3u4q7q1ILB9gsK4yuT
 BKb4LPYsTR7Rw/e+YcrsxcAcnf2Awmwo/0+9yuVCn0QImWFSHdoeOsUJcmU95fITdpt+D5iEJ6d
 PFieNqoMBwLzDZd2QKr/Zyc7fJsjMbxY0zU+XZ+OCjyKATtDjNv02g2bCyOtGrXJLXBuQ+qHxSs
 9FabWYIbuct4mSe178qo2HuJn0wv9xk8OVMDIs2VH+Qa4OVNiBbmeFc7HywbC5mRw3AsUsWb02f
 Z6HqfhwfCswNhiA1Payq3Wqh9NvR70CJ1Vwq+I4LlDMcZ+XW4oiAkFQ+vgQrwk2OCHe7PImBa4X
 AN1ajNKaWjj+UpNu1WRGpVhnvvWcBcLdid1c9JZe2m7s2fwYCYh0OA1m8jTY4C2lM99cQ+HdhWH
 MeV81EzbFo6g+ZjLU18y2NBWRLj0VXnKgqU2TeJevQHbhj4Zf2QlI0Tv/kkW60LSKqJN2QpV8vo
 Dp3BnorYvEoQSsw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: ruif9ugdbjs5x8I9afGEt1fafGEbYJXl
X-Proofpoint-GUID: ruif9ugdbjs5x8I9afGEt1fafGEbYJXl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX6jkN637x4fOC
 t0e1UBgzTUC7Wa7L/JXQk0nTiPcCXx1NmcpJLYjlkSqzrB0bhA3VIwCE1VEBzfwG6Xn7V1/i4Qx
 a2Mg7L6XRSMhZYhKM7U7JXm2dJKV8bDHAO3AJCS7kyhBXqgeBVAbvrIDsAuFrJyFMF3ps52vcpH
 bJRIex3PJzuF7MzuX9qA6XjSsy9wzkKho56QId1OAZIIMWPE/7iJTXL2T7UfqO0B20DPDZ7GDpz
 pa/GvdDfBHybN9y7ICG8BQENaPt6l8rHp9vRo55U0Up8z6FA/x3/6ts2NFY2kdOAhlcf8VTnRW6
 b2qBvToKiHMvO51Kh4/aPoLa7ra29eqgoEEAYRCiIuQG9mLabd7tPt5TPoSUKrKnwmWWiEIyODY
 d+DHklsrLO7AmkhDj58hORfi9pPIPZ3bSQ0DbhVXRlHyrzx73WCLI29MtkeunHGRF+hyffsR8ST
 onV1aTQUFbsZ2BptL0g==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b096c73 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=ouYIBIRpUQI3KAHfuYgA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX9+Ir3lbpRY96
 fZ/oJNakErVcs8Kd+qYGSPzwvgeVChnbvhCPg9L7bd9UtVN4psKWWud7lzWltEfmv2cgpREejZ8
 kaoG2phrWp5ITL2rBj7gdC4OYeUtYKo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270046

Qualcomm Seca is an automotive SoC with 12 Oryon CPU cores that's a
slightly less powerful cousin of the Nord SoC.

Add the negcc, tcsrcc and nwgcc clock drivers along with bindings
documenting the hardware and update the RPMh clock driver with Seca
clocks.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (6):
      dt-bindings: clock: qcom: document the Seca Global Clock Controller
      clk: qcom: add the Global Clock Controller driver for Seca
      dt-bindings: clock: qcom: document the Seca TCSR Clock Controller
      clk: qcom: add the TCSR Clock Controller for Seca
      dt-bindings: clock: qcom,rpmhcc: document the RPMh clock controller on Seca
      clk: qcom: rpmh: add RPMh clocks for Seca

 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../devicetree/bindings/clock/qcom,seca-negcc.yaml |   61 +
 .../devicetree/bindings/clock/qcom,seca-nwgcc.yaml |   69 +
 .../devicetree/bindings/clock/qcom,seca-tcsr.yaml  |   65 +
 drivers/clk/qcom/Kconfig                           |   21 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/clk-rpmh.c                        |   16 +
 drivers/clk/qcom/negcc-seca.c                      | 1458 +++++++++++++
 drivers/clk/qcom/nwgcc-seca.c                      | 2138 ++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-seca.c                     |  147 ++
 include/dt-bindings/clock/qcom,seca-negcc.h        |   98 +
 include/dt-bindings/clock/qcom,seca-nwgcc.h        |  144 ++
 include/dt-bindings/clock/qcom,seca-tcsrcc.h       |   25 +
 13 files changed, 4245 insertions(+)
---
base-commit: a9c48428cbd8d96b26f92631d0db6f8519c5fcc5
change-id: 20261126-seca-clocks-28e44d453241

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

