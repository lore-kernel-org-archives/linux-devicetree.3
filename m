Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050DF4EE86D
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 22:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790374941; cv=none; b=GD4Au16D+VQkqr362xBgGo3jfTvrLbg9GuGeAhSV/kHr4FQ6gFTj9sJjQZyEptdGtnykcCpJu4psCfwM6LRVoRC8uhjYGiTCk4OFzfp48uiwRjcZntCALmquwpLJ2bgxfTp3xlc7wQxAL0cfvvjg0OnOoJEEevkVegNowVvuv0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790374941; c=relaxed/simple;
	bh=WDe8Nwp+8tXA6JvRXC4djLa/L7jH5WXFM1d8o/bcDuo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=i2y1xDticmqaCOYYN6kmOSLWVCw3y4pjlQlPf2b2FqYw4vvGStOt45JiD/NCun4Sjsqzez84rXsI7LHAS4V6uLanbZSaGT7Y5+3nSN5qQUvNoOxkcYk/vPAUgblRTvX7vEr4qN6Vb7LUKG5btH8+4heFYi00fAE+GllVNdz2oGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nwUVcUn/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wam161OC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nwUVcUn/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wam161OC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PIno7e2889409
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 22:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b1UmO4gb5quvleiJFqJ6eQjdTIgUvfS0JZPGJANlm1s=; b=nwUVcUn/sbesiu89
	0Im27RQQaQxZOJOZMyZhBMAlzBzDobwS2C6op74TgxAPFnj0beZHkqBa7c5CLnsS
	+Onoxmf9CEV3vB/unKZ1YOPE3UGaAQQU/n+S/XnZQKzMLu3prC7rS6/ezNBST70E
	lxl2cAsYAR5I4wGm+pGzk80ICPrSurQ+0Jp/sifqFF0tvKD0k0VwPb2X+2CBrIq7
	5fU+OdvOD5/6+FBxw6szO0tHDhKX6Z+Qe/TOce1QmxOqkzIL9Eo88G8qrh9Nq1Dl
	8/USu0aI7xJje5ILNbZETQU9yXNHd2S6krTrFoFibLz0iIe3VzodIXzYDnvPvoWo
	TouHlg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwwjc8y0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 22:22:19 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-14371f7ba1eso2095211c88.0
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 15:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790374938; x=1790979738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b1UmO4gb5quvleiJFqJ6eQjdTIgUvfS0JZPGJANlm1s=;
        b=Wam161OC4FjEx8v797jE6nE0PGDipHtia6ibmP9wy5jfoPbYVocjMXnwgsMKIAmP0Q
         wMEhFNFPSSJTZFkqmg1SnRz9exJ7rCK0qO9+AYUu1U0Ovxp8rIYZ8rVtRbp2lzYeNFOj
         xA80xKABD4js6FYQSncs1zxKuzSy+qkIIwn3GGgJo/5gyAwwr96fkijazBag3F4GzQ27
         0K6hsR+TNANWGwZHZ/wcEiML1odAJWS1g8wVyQSo6LKcTecnwiYvy5Aast0QPzltJvKS
         guzcH9YB9qcpSYhrRCAsVZegwg67veTcxQUNENAadWaokT2UHm92Waq37hnEacJj8p8v
         sllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790374938; x=1790979738;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b1UmO4gb5quvleiJFqJ6eQjdTIgUvfS0JZPGJANlm1s=;
        b=TeGkcvKm2TZuGGMstXwa1jLvG/5TSeUMfBgEKYIvqdnfNqDAK/uJpRTmSj0Pbkwjoc
         8aKkRA4/D3WU9hg4JQkJDLD/GBlLx87K5Afg70KACM3xEj793II0PbO4aFvzK7X8h255
         GDJaRsVZW69VUpADYDxF9QAIY5mAK3/JAucBDyHG4hGaWCEJS3wNgGwqMJejBW2Znvfl
         fdXlibUIwcQQK7R7FJ1GNRrDosOOpq5O/fkpkILDWRK4REq8rLCkmdhq6wdiwcO+56wH
         Xc6DxtZzQlvSrrP4v0tXc71jzVwtEGm2pB8vXKziCHrS3EY7CZRFQCHWGAX9r7Ts29ka
         yzEA==
X-Forwarded-Encrypted: i=1; AKwUvByCVbLlY1MCVFtSD+NUaWAFrzcxnr9ITreTmVOl/SHtQgew0Lw1PeeK7pB6Z/DTejo+JFwVUb6U29My@vger.kernel.org
X-Gm-Message-State: AFuF++koQJEViHwQfe0j+zdPD5f5xCDjZhnUlihlqWw4J0G9NltsgHDp
	YW4P/sYntfDkrp44kvCuJJERzU3NmFDI7C2/CjqmTr8s29Kv+ehnX9W4Cp1pqlp0o7pnB0H+WCc
	UsWgI+7brfpYs9RWspQMkoUuO36wOcOGy2+Z18I675CK7JNtLNyRCSVeZFsPX4kHn
X-Gm-Gg: AYBFou3Vr3+yH6c4tejYLy5A8IHVjIqy39/XKgqc1wPNR4wG8U4fDDLPQpbEDBaR5q1
	BV+CavQKQcxzypxXBM5Mw/jAcfjrIcv4c++aZgVzX6I0k5R5pE3X0ogJyPgU1HompThAmWx1LnL
	49CwG4+bV2GbbDhMN4z2KXwOk/4Z9fqGclYSwrv5jrgqmT5n+AHYPPRyURh8GJzLhXWkM31ZHC1
	4wGarmZFWWNa63Hw8kD6TIhIUPFQIwzJslv4mLCcyF1CKHVeI3wS7JvSt6z9IDmp5xUCrgfZ7Ds
	pZy0oXEjJIGX+WtCtq0kFlks3aVAGJdz76SHYDGkl2eSZInb3PoJ5+IVc9wI5n3ifPvlpx2X6p+
	aZM1MFEpTXD0FKYVqoSQAgGNsiywxKumUCxYfwSJOe0j/upS8rBvsYw==
X-Received: by 2002:a05:701b:280c:b0:143:296a:c862 with SMTP id a92af1059eb24-146cffbd728mr1187753c88.26.1790374938444;
        Fri, 25 Sep 2026 15:22:18 -0700 (PDT)
X-Received: by 2002:a05:701b:280c:b0:143:296a:c862 with SMTP id a92af1059eb24-146cffbd728mr1187736c88.26.1790374937815;
        Fri, 25 Sep 2026 15:22:17 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-342c9c245a7sm1273621eec.11.2026.09.25.15.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 15:22:17 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Christoph Hellwig <hch@lst.de>,
        Piotr Kwapulinski <piotr.kwapulinski@intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
References: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v10 00/10] Support for block device NVMEM
 providers
Message-Id: <179037493652.3059844.6860403127536084948.b4-ty@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 15:22:16 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA4OSBTYWx0ZWRfXyHevTvcDIHWf
 OBXGmw9x+Ev0J4BUmtwdXq15n+nB5OM5UAziiWm+koeCqZYHLzT59SeZUCXh/5bR8ukybF3dtYo
 ENcLOifNZLUi1HRHgDkAFSvtnVDBWbo=
X-Authority-Analysis: v=2.4 cv=dZwVTnXe c=1 sm=1 tr=0 ts=6ab6f41b cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=3vxmhWUQDq8JHCpcIj4A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA4OSBTYWx0ZWRfXwR8XGais47ZI
 xMGFTAc7NP6HaA/+CBbt/ajr6TecPNqZdaEIzFuJ+S2QA2wBtbM0ytVAzWpXy0cSUbpvoQTONnw
 Cqsoq9kva/3qBn8yvfk0IWSp77Wvk2ZcN9BPGI6cB6DXzjTLOlb15SfAPbp3VWl0iZUWVmRACkh
 2cvO6pE4R9wBp02vuWX1SRv5L54YlmJtHLKOaSK7F6xrbqKw35HasgTfdnhR6jSOJQjAyNJv28J
 7DLsOVT0oApnZ4cbmTKvwY+URaRCaN/4nQcbgP/pylgrVzha6tYzf+UbSMJDc1+c7qFpx+6EipW
 kq7ytNenLBBmAKIW+OO3+CjcDp3+gT4sWL0Mo9VFrhM2i2Ii30mhz8OJzKzYCY/NohGHlFVHA3f
 kqjyS6XFhc6873Zz+tx25MynB6C6OhP811K6YGai1fwxl2YvWKKOKZ7ccBnaZ/OcwC8a8/d2s92
 /IotPln3lF0s6YdlWuA==
X-Proofpoint-GUID: dgmxNwk8wqq-hIdb3ulQftr0o5KuszIL
X-Proofpoint-ORIG-GUID: dgmxNwk8wqq-hIdb3ulQftr0o5KuszIL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250089


On Thu, 06 Aug 2026 16:38:33 +0200, Loic Poulain wrote:
> On embedded devices, it is common for factory provisioning to store
> device-specific information, such as Ethernet or WiFi MAC addresses,
> in a dedicated area of an eMMC partition. This avoids the need for
> and additional EEPROM/OTP and leverages the persistence of eMMC.
> 
> One example is the Arduino UNO-Q, where the WiFi MAC address and the
> Bluetooth Device address are stored in the eMMC Boot1 partition.
> 
> [...]

Applied, thanks!

[02/10] dt-bindings: net: wireless: qcom,ath10k: Document NVMEM cells
        commit: 753baa59527f8e606c49eac25692b8b08918a3a9

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

