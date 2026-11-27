Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779756;
	b=vFUJ9SAfBQwL5dFfDJda1ig0jekqilHbG3q4SNRxBpmgkXg33EgH443Irz8Uy4WtJglh
	 E3Wr/AJR0+SQWYBSuhPAFJ/V/Bf+IuEFvfMFPZRjvrnrhajIC0uA6Wl2MG56RyPBep7YO
	 Z+27cL2ck4pQDOTlYH5K9OWBwhrxhSZVjlQjiKi4vULKm+04uPVvRcnzXdMtDy440czMc
	 kn22KFdBNS02jI9qHQ05XQKsskahJzCONn4tsygIOKd+ssKfjWE77xE5hLdXqsmOcgWLY
	 yFVkdLMjZvMhcVD4h5I5BudeatXrg8nugVsNBl0eTlLFx3A/YdeB8BGvWS6aqJ/oHMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779756;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NyDUwgrh6wWbTckiN+W3o/gquXyln8i4quGDrjK+rpw=;
	b=COrq7XgAmvUWiJxifmK1qQ2rjukoFFpy9eMBakweayt5XDaJ7dfWl6HwY1bJZm11oMPB
	 11UV+hSRvYfVczw8g6t4MaxUe5bSrza7eYvRx80uh5blcimaWNyYHkYLQ+6gLkzDI7ezN
	 P2+WsyN0UZ89+GNzzIrf/N4LyqwWucGlfM3KQMgFcGdhmj2yLlRqZ7kHx/x6hMqXJhycZ
	 ZlAekEAAqQVL86SLkUP0hK3NRDWLZviyrOxrU7r2Ytbv/x1GTQIFQArVuc1Jly2M+7jTb
	 jDxtQQ3cZ3w1vFm5ItECLurp1Bd7dYbMHawSOOP0OZMh2ucTHX0k/02eiquStsXFOcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Z7cl/HqJ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iJdW2Dau;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792ED606A323
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 792ED606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z7cl/HqJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iJdW2Dau
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApXGn052759
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:42:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NyDUwgrh6wWbTckiN+W3o/
	gquXyln8i4quGDrjK+rpw=; b=Z7cl/HqJCSj8mduH7FEaRvabZFow0DwkuHHlFM
	Y1HTH92Y2f8dWljTKMZdM85PZqr9NzRL4y/4I1dAbCZSftgz1Okll7kZ2YpJTk6V
	xnr7lOznw/qUiiD2EK4nazWGiSfVUIMKQGZlseipztNWCkSQoXJYTicPgmh62dzD
	wSwbcM7RfoSNob+JeC9sqRP93XHlpUs4X+TrniKWrC85pSiCiKjBPa/I06//1W9e
	ZsY9q/ZxWG5Fkihoprslzzwngxc3/TU/Gs9ujo0FK8TjlOTVM92gZ1NgZdKrC3mS
	3wsqud8j18MaLe6HonMQF1TqkMeR4d9mHhyjuS09wYspUqzg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6s8bb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:42:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so1384218785a.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 03:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779754; x=1796384554; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NyDUwgrh6wWbTckiN+W3o/gquXyln8i4quGDrjK+rpw=;
        b=iJdW2Dau1eHiyIzITJ7HUvaLcQ28wTyzNyE1D63lhphhNREEg2oc9nQwdqs1mDoTga
         gccZjtt0T42BhYTW37/sLPDr5vXet1YJNenuZP0gNQOHhw4BDHL6a+YUW3uytxdz81m9
         s++bVTeBzjfF4JDMGUEh3U1V/zTlAXhfEHNSaJjZAgr7KZS21ysGdkl84aDc73OzrXYj
         oEYmrXRXp+Pg6poS8WfEUba8K8Wc6bvt6ZhDlBl2dVagBKaL4N3opWF/cezo3UDdRj/E
         QXskifGj5ezGG+XgLFeWH267SlIaM5iPMN9LIq6QSeMJX1geRh9C2VMuoBX2fTa85YTg
         U0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779754; x=1796384554;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NyDUwgrh6wWbTckiN+W3o/gquXyln8i4quGDrjK+rpw=;
        b=peNDvLfh6IkL3s0lh+VWGbpywjx6jrdJLaIfCPTYp+0XXLl5ZbxrQ0Ez9BFu0anDPa
         JZEZgUEd9JkubEYKXJF6juRyS82rj787AZ6bSuRKMmiOguGkkSv+exEDL2L1Nfzyam9J
         QeTCBLPzd7AQIBAIPAx3PQa2tfWOKSGsLwBYpUDDQR5y1dZBjJw4lCdYeZUTxOnK5H/v
         ds++zEyGgZFd6snH0c7RmRJjRvHK0k2mrBcA+8JbOOVVx55AC637NTRUkOK+BNxSYBr2
         +pdaUZC4qBDr7GlYKyYja5BmZQz63MsLL3fuPIHDqiQfVVgpOpueKfEvesBL46BSOkEq
         U4Tg==
X-Forwarded-Encrypted: i=1; AL+hErH0oFq51sTAJ2dgnN+6Ku/JQfi2WtFOWt79UV1NANpPcWhWQ3daMWCUipFXzlDeU0MV+pDPgf67GAd7@vger.kernel.org
X-Gm-Message-State: APuU4Z9EIEp20RdyH8+uOoNH2GBO84AWtfVBtXp4F2CjTW1vz1qiPww0
	b+OYugNxhgxJkZhaQi/M8NGz5Apv2O1eMNlpL55O4kUlyV1W3DNYLxLnKuq/K5pNM6s2Nv4z/q/
	HJuYa93sNZija71eSoXHBvUfrNCe2OCLI55L0rmFip18draSLZ5t10b2YB9mLJxt2JY2H2UPn
X-Gm-Gg: AZFdTZcY83THpo1z2bwp2brsiyNK/7WZMo7gsoaRbCUNqaerJX2JO/X+XTLqReAJnZT
	iyUAgfjmG8V2hZ2Co56Fn1sQNU2fQspDISawfqB3itHYiZ25Petc+OocxBFBN7pGgYGgkMWF2Ut
	D5kDhv7lkIZRwnTrzmC2hsp6KEXl9nzslDXud5eoYErF6ypWqTWwjmwV/rpPs1qRjqiOa9YGZ++
	8fN8ClykCzIJfR5XCKN9VxEetem1uva8gf7hJ8Cw7Mqn8dWv3m2Rw5HYEYxkLlm0JbPfhNWtC/q
	+9pGimgnuBO57BmN53gJ9dbPI5d+fx2w5lOJaiX6qMeBuic6u4U0HsY4Zid/7grAclmc7YfWuOo
	aGNa2AZEc/VqdErYHZOQsfgISlUeIAfEY8/mNd6Qw9/+cBtyrRHy6iNNKNBT01w1XynOC//5C3l
	9LFd12czDGhs5JrcGtXAKKKeJvS7Zy5kgYOK/km/ZhPtnN0sBdr6lYct4Utr/1GLs=
X-Received: by 2002:a05:620a:c42:b0:949:5c62:e77e with SMTP id af79cd13be357-949ba9c6de4mr4265140885a.14.1795779753783;
        Fri, 27 Nov 2026 03:42:33 -0800 (PST)
X-Received: by 2002:a05:620a:c42:b0:949:5c62:e77e with SMTP id af79cd13be357-949ba9c6de4mr4265136985a.14.1795779753306;
        Fri, 27 Nov 2026 03:42:33 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm56457254f8f.21.2026.11.27.03.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:42:32 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/2] interconnect: qcom: add interconnect drivers for
 Qualcomm Seca
Date: Fri, 27 Nov 2026 12:42:28 +0100
Message-Id: <20261127-seca-interconnects-v1-0-a31bf9b36ac4@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAKRsCWsC/x3MMQqAMAxA0atIZgtthVS9ijiUGjVLlEZEkN7d4
 viG/19QykwKY/NCppuVD6lwbQNpj7KR4aUavPXonA9GKUXDclFOhwilS00/OG8DIsbOQg3PTCs
 //3SaS/kAYkpvNGQAAAA=
X-Change-ID: 20261127-seca-interconnects-891207666a30
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Tyler Baker <tyler.baker@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1033;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=T5L/ehKajD3lC8IkBxCGBFiU3AnyDbdankjiDTN/CUQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCWynaNU4v9gsq42PA5w0vDEQ9Pux/2f/2KROY
 1Y4njgT/AGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawlspwAKCRAFnS7L/zaE
 w9jED/44rFltmRX3o1MM89yXJkc0vId5h6c56ucCmoOZc8fXZxq9v2dbxdYhF7TBEaT/R9yOpmu
 nj10ikKCqGJs/wD6SHZlf7QEr/viB9qTGrklYu5TVoRr18/EqdHxiFStFUm4Mro/MprTo67ngQl
 Obyjy59Ir41JmgXLDZ+0LoYNi6+ahFoQS54/KXWMAdI3MwFHsaCVtXwMDpeucSJOiBQ+JDLojzF
 k5zNR8h5uunisaHi/FfBPvUBSsgc+y7dodqK3+vl71RWLvyYq7qAbRqsFOQ822nT63aiU0lTS2I
 VqqqcSmy1SGn/Jqkv9/Pw1+HmUhG/YsSHPdsHwGamJWmWkMsDTU1noaDmcX15rqSfpqmBHtSRd5
 dCBVueY3m1FTfwRTw9UQFsRE/5Zn4y6oS/qSWt5xoP3whiPBUiBTYU6wi/efENORYfE+YaHFBKQ
 MDohUi0SIE6+n008gXszRiHSKKmlEF0OfPVeMzOV3djHoLFuiu5AwmweySE0vkYqsM1GFnytr2h
 eDvAxPCIPw055CdwPXgNh7qw2z0CL33zktKrbngnGlLtNsT3WIwPaB+ks1mjLYTvpXCGOitmJtQ
 86KyNaELdGt25Y2Uf88A38W69/i9Qm5pFEZrxUKCENFfVLdn6A0vPReghY9K3nFJAPeTwUcWfy2
 YGuUfJdxZ91+YrQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 0W78kNQhOOq6WrCSzeCWIea7mhoOC90A
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b096caa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=0vBr5WPP46mkPm4xHpsA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX4ymTZZcu6Mp6
 imW5PXoNXgf0fPCWKW8PwSSgypSZ2u2wO6VHXhAwMabv3ZJWIcAA25FfJXEQ+rqpHMcOQ37jsOd
 L7jCGuJwfnWv0ZzC02aSq0v14Rl+2os=
X-Proofpoint-GUID: 0W78kNQhOOq6WrCSzeCWIea7mhoOC90A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfXxuSKSM2iFAoX
 G52O2cCbIe9+PmetrW/hXGiKXgy7v6BlraJqGi1nwbUEQOxCVlcisaBw+9aZeYUoo1mfHfQsHkD
 7p+fH+wDzn1VAWoCIPom6J0EdZehx4hvfrz1fVirLcunine/WfdwmrCF23Z9B/RrgxCNl3VSmqj
 Z1o5Cct43vGyWOvWPriJWjOzHOHN22G+94kWkvc1DlvqHXn6caY8OqtHP7OCbOxV0LN99/XsXUC
 CEykNjxjf6LfhFlM69I/E1gXoY0wNnL+9sHLPrw3hSO89UqhcItpYUrAqwUDY60ElQijWxr7a86
 bbSIJDPupDP8PDNYNrV43hIaKjrkOx4Xdk2qm2bmgdchs1cJOtxxZbd9BBieFedyUG14Pk1gUo4
 BL7o6adXDrzIo2Ku6ZYgVfE5KfT++Ksr7KK2njO56qJZpx6ExFvF/Xya+l0tWgKW3cJ6yVxqO2Y
 Ju+LgcPiM4WrtRVkrYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270046

Qualcomm Seca is an automotive SoC with 12 Oryon CPU cores that's a
slightly less powerful cousin of the Nord SoC.

Add the interconnect driver along with bindings documenting the hardware.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (2):
      dt-bindings: interconnect: qcom: document the RPMh Network-On-Chip interconnect for Seca
      interconnect: qcom: add the Seca interconnect provider driver

 .../bindings/interconnect/qcom,seca-rpmh.yaml      |  141 ++
 drivers/interconnect/qcom/Kconfig                  |   11 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/seca.c                   | 2335 ++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,seca-rpmh.h  |  191 ++
 5 files changed, 2680 insertions(+)
---
base-commit: a9c48428cbd8d96b26f92631d0db6f8519c5fcc5
change-id: 20261127-seca-interconnects-891207666a30

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

