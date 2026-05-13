Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A45357D17
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778657456; cv=none; b=s0vT6S2YXcVA+zlOyInCLfVDcdGwwK1Mu2oGJtFRbWa3PdwP6Ab39ClymYkPvwnzDBI0lKq3NgtCZHMcOPMvpmPdq3meBUVJe+y7jqpr4N3guM5VbSxOdFGSOd0urDeUrJxzz0lr4TnslPQaRwCvELwIuW/NauBLFHmwT3itwXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778657456; c=relaxed/simple;
	bh=ukvh32brRelqSp7Fv7hYFEkAzrj+aMDUtsm2nc1tQyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AzmAgW6Rc+XXCwMn6a3H1yzcw7Gfm/D4zE4BziROITFcOVwU/zttafClNo6RF1Yj39ISWX+D1JoDZ/QCm+7HmqrDAQ3nWg4iyYIcbIRQoXUk44aFyFmfDIK/BwygBSHU+Tm7yBF9lM8tGWmTjwzwKgTGYsbOfNm9mYpO+DRICv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XizRvr7r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LqmETebq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XizRvr7r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LqmETebq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4p88V2932978
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cPqkf7KGuEQNIuHg0FdC6AIR5xbIzVEIZFla5BSLQVA=; b=XizRvr7rKeC51Bav
	NRHzaOrP4tUnNO071pVYcVxjacKC5uite+PkfZhEDiV5C845jGc4VHD59qEoW5ie
	Q0MM60jHTQdpCIWpVmyC8Z1+RE6PyXSbzEM7NIpsb4YNNViKGnAVWFlzEm+uB5iq
	GnB+dsyCWsT/ytAiKL5Vn7WEbHLcgYWcjOVVMv9sy5M2/0HpN/rFHE/nyu3Bq6wO
	/G9L0ptMs06m/ne2V667bA0eaZb1XpijwxQyYa1SDo9nP0LcAdW6d+xgf+ly13N+
	9J7ekWINfO+WockGYFA2IJfDFNeu+hzKV1DQGfHjwuZRkJ+HlifI1P5YcI9tU1nE
	8ysxTg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4319v91b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:30:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-514a182b90dso48523731cf.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 00:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778657449; x=1779262249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPqkf7KGuEQNIuHg0FdC6AIR5xbIzVEIZFla5BSLQVA=;
        b=LqmETebqfUMkNeFgHDSRVI80KQSt+8BHjJD6IJnKo5DIvaGZ+kZ/HrFa41byofNePs
         BqDkYm5Rk4DEq9SYBSXj2IB5snfv8U8bEBH7ynXKja3S28nqJMq+CL2sd4Xrqcmx9eIl
         m4U5VvS3XN6bRVWdZCqichr5oqvZipo4JeZgzgNrOYEyXGPgLJm2TbOJETqp21V6Io2l
         h8S5xbw6825Dyck9j2sb/Vz/qZQnbu868sVN7AxwLqGbiQzEwKXxQYJqIkFj9cqnsGD8
         bbDDjNngkMhjMNNt0ugC2kI0on7lzbPsfh9dX+RD5LdPRe2nx1iKXfhcY+qe2SNrqmfq
         B3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778657449; x=1779262249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cPqkf7KGuEQNIuHg0FdC6AIR5xbIzVEIZFla5BSLQVA=;
        b=RF0jAGIy2upqQkwwlNK2WgnBG3G+sq0wdhtegKTJTvoycTsmoeJd7GUlajRe+FyV7k
         7Kt7s6oUEDj1S2LftzijeRoKgPDnIw3VeLqLl+C/kTVotirPFAUFabbeLin9ciLXMouf
         QEDIVpSqVVK0GOPrUaID6OI8Vj7WwZXb4t4/g9d2xltF8Bg3Sx8gw+OrQmViDLPAPbtm
         eNtlIOIja/RJ1Yk3o9JxtG7g3uBdCPQay1klxqxY/0y3e2MiWrZgPj0ORK0t3zIqdALG
         lBXGI4x6KSlzgXI6L47k4h9C0L1t/KzmbBBhdVLar1FT3mjCPTlioOiTgZeVVsbr00Yn
         z5dQ==
X-Forwarded-Encrypted: i=1; AFNElJ+qLDIDfQQ1O+B/pOyCgVqIWZ1wERRFaGy+5XaNeY/5CRiXUN6ZoQRgM0uuptwDSRVknUkDMoopw9nK@vger.kernel.org
X-Gm-Message-State: AOJu0YzPP4QI6IaP4pjXpMXCaoBJL/2YmmNIAf/j9xAtYtij9CJEaUlt
	L/NKXpeOOam+NabrLn92rOqPrAut2WUevAvTIRhOnV6JlCRa10zbvb7cv4Rlti2jX5RBYgn0xJd
	OHcFVDcM4nHDPb2AC2ivru0sX5Ddo9nv+o6+M2bBRXj/Rgh6lAhQknIo+gxcuWPY8
X-Gm-Gg: Acq92OFXZOa7ueZd8i9T3Z52K9IwAXVv+NA9r68xIKammJO1KAldqLxP9WKBwoQ5muj
	tnA+4TSUn7Pfwj7NR7Kz9BpOuMKV3xyfKla3cRyv5QqTbqkBinSYXz/ubbGQGWAoTDTkBVNItgb
	27tNdg3RfRFZ9lziKwas6i2x0Tdey2rVbNeeFYjSYEc1uISYhALJYo/bW7WJOU0AxSZZXXOB9XD
	ssQ9ea1lkvT+0gC0Vn0Yop+zjMFCmj4nICzLhhM2cOv3V9KYnIj3iDoIuVME3wmJmcOaE8dFP9W
	dg8jRVkAxhlSKCom+FcsizeKXSOtoqQgNvJMdzVvKBMkpK6RDQvz+tKitpR6yY0lo24O4e/MbbA
	T/V/gBW3/CmNwCCR944Q0/YS/jxBVV5UCNMQDz+jQ8v940a9g
X-Received: by 2002:ac8:578b:0:b0:50e:635b:5564 with SMTP id d75a77b69052e-5162ffa9c1fmr21300121cf.48.1778657448771;
        Wed, 13 May 2026 00:30:48 -0700 (PDT)
X-Received: by 2002:ac8:578b:0:b0:50e:635b:5564 with SMTP id d75a77b69052e-5162ffa9c1fmr21299651cf.48.1778657448240;
        Wed, 13 May 2026 00:30:48 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:63ec:4acc:c4f6:423])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce05f41csm47977105e9.5.2026.05.13.00.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:30:47 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, git@amd.com,
        shubhrajyoti.datta@gmail.com, Srinivas Neeli <srinivas.neeli@amd.com>,
        Michal Simek <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/3] gpio: Add EIO GPIO support
Date: Wed, 13 May 2026 09:30:45 +0200
Message-ID: <177865742113.5804.18266308957127851579.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260512060917.2096456-1-shubhrajyoti.datta@amd.com>
References: <20260512060917.2096456-1-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA3NSBTYWx0ZWRfX9c0g3BG7tiGo
 Zs8ZssZJ9EUXGCJEfz1GN1Nn3H3xGPjJDtWU+hvw7+CvTp8YxuHxZQ7a1oeHRaXPMM4PAayJTKX
 kGuOsEaZWDYECQIMfgHrOzl2+rDnN5xvKya6EgISUolu2LQlL5SFlrPp5KXZzsOtd4Ub8V4P5rR
 DGvCEXTU/4/48qBf7JF9GqyjIio3z3S6Ik0WCI/UXa8BScwtqTee8WlIb0KspgHbgDDSXEeyACp
 QxgRKd1cwt7SILhZ1JEICuoo8m9dxFiugmQ1rR6hr6F7hKjhTGIWgFz0YGZoZFoaNhJpj6RPWfc
 sMgTDnyMZJAZ08MyMNHn7wgv75h4LO08gZEkwUCQCY9FVJApFXxAVjD1RY85UlLf9eqUvAhHx+C
 /HuoVFsIxUIHkTwAvucuuEtw+SYRYvWN1ooIWDznVq7eDOXq4XTSCXzlJ/lywOlBKYu8ChuQx2P
 SWGEgUc0jT66GQdp5XA==
X-Proofpoint-GUID: zMkgbsaOPUNk0E1xEenl3mPiJ1Jdv9H3
X-Authority-Analysis: v=2.4 cv=bp98wkai c=1 sm=1 tr=0 ts=6a0428a9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=SWcx7dvh2R5ZX5NTVYcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: zMkgbsaOPUNk0E1xEenl3mPiJ1Jdv9H3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130075


On Tue, 12 May 2026 11:38:46 +0530, Shubhrajyoti Datta wrote:
> Add the EIO GPIO support.
> Add the dt description and the compatible to the driver.
> 
> Changes in v4:
> - Add Conor ack
> - Remove the min 52 for eio
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: gpio: zynq: Sort compatible strings alphabetically
      https://git.kernel.org/brgl/c/3eb639ef8da2d418ae69f3c8840c4e815036adc6
[2/3] dt-bindings: gpio: Add EIO GPIO compatible to gpio-zynq
      https://git.kernel.org/brgl/c/18409d06b4a002cb8550ad7c20273bedc77851df
[3/3] gpio: zynq: Add eio gpio support
      https://git.kernel.org/brgl/c/eeb1d6dfd89344b17afe845d4839b79e37fdd547

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
