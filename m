Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4F13EC6B9
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787742993; cv=none; b=XfvKA8SjXuH5T/BarIc7lNU4jQd3Yvz2TJf4+weBr/kKXavsQOnSoa+5Q3//nHueoEHXPD6pi+b5g2uC7RQebOo0GNbUSwurjSFuN/U4/vMvzeOplUlcodHpn8Bq7OpAK3Wly0Ujn9FHQiFtW4qj2uMkeTlqfE6HcipqmIJtHiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787742993; c=relaxed/simple;
	bh=dKa0bkhQNHGF3ECM0RaphHFXMQfLxiwcJfDby9lcfX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aIunmKxSEEFC676zDuFSh7267AYgG2tEMO6RJYfD0h0xDt5VlnsIBN5tsMSfOT83ku1U6B7zL76fxrcDdWuGy6sjotdyg3J7I5uytSTTAB44wrZHWBw+13JqdEB3Zz3Hv0iOovdhxGQLWOvRnnNaNjLgrAFQUdNKu4twh4rWI+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YDq7aLM5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CA0xa5s0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YDq7aLM5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CA0xa5s0"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGgRi647024
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9iZ9pKopk4L7oAcIHq+UKI461gaq/BVhdXcIs0vKk0Q=; b=YDq7aLM5P3X6qlvh
	jN5UBGJlXjcq8KY8QAOgB9r5d7iCs9NWk18Ie4MgNDeJkiPfnO2uLyskwFgxyN4e
	kO3ltYQIW61sGnuV+OZyT66Y+4H8Usc/GUY51F5Ix4W/S0BxnlQjthW7G68IQYZy
	3xKMRiUBV2CMnB9xj1bY+qY366afl6dS34W+7nsm9ZDItHQzeS+TAsBCsTjRiQm5
	W8lBeM5gP3Wg/S7QMwe5e10z8I4qpa+bz6k4x8+NUYNK5eoQdWdYiG/yDtXGM/to
	+ct3ggNKGtnMvvj0Tn4WajUi19+wKZd3JTULFTNfAPc//AwgOtv5GPExgvuSuFnN
	ITXrFQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9g4mucmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:16:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52dd69b00cfso9614441cf.3
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 04:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787742986; x=1788347786; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9iZ9pKopk4L7oAcIHq+UKI461gaq/BVhdXcIs0vKk0Q=;
        b=CA0xa5s0FKaOI92cGk1Ifu9Un76o6ogefC32zG3HtezfC4PJGeiV1iaxvOJdsxAzg6
         j1PnaTi2/znL6mPlgN92enMIeCrcxVRcbj8q0IrXDP0HMgAxlsUitArSuvBrpyOiWWry
         I+NEaF9ibUEoJ0ROr6m7oap+KxUqvla3uUnGZQ5P/s1NFGoGS5kAv6ALUIP/cwBRHp9o
         k24YQ2nwI1X5i/axZ9Ksnr9pYInEoGmyXuiUUePI/InbD16Jk/8UWrJRY0Pi9cErpPq6
         soRRU2/hI6Mwrb2kv0c5gaTdQUjbuWKqvEh3GpYvs6Y/GhF+nPn2hhhFOsInH3XxUTKB
         E/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787742986; x=1788347786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9iZ9pKopk4L7oAcIHq+UKI461gaq/BVhdXcIs0vKk0Q=;
        b=Gkch+KgSTux3xZFszi04VyVLVpG/HsIajG4tTKqp0osRrmiEuAkPfWYUwz9rCj99Am
         UyXIC0jJoiX0KS0yXQPM3zyTsLb7bIMTVN1qikO/5IZXkl2KvxwWFqR54LTXzFJI2zt/
         evIPFV3VaPv9ZY4HnAq52PfUBNt3Dn1amHuBYfqTQPNClq01+0phknbTyJ8zzUogQRUx
         6MWTbwP8xKUdnc7sfFOCEibaw7wEGBQLtLs2jWO6vNvagKEzBKa7L1YUXWb9jisrCAz0
         TMgVZ0q7ihbJgNtWU5qz/QzJyyao7KwO4gI1bBP0iMCY58OyovSDyDmFn2/hBQydDC1H
         Mkfw==
X-Gm-Message-State: AFuF++nENl7+Uafkchbp7P/YPnXZrkqrgLhBUK2c4HqyIVQmzlxBjacs
	wi8ufD39NUOmoikxJbJy+L+I6+m6hTh0Ixhq0Ht+i380wtp632fqRaU/uxhFm0/K9Lv3xZ6mQiQ
	b8kwfxv3xPW9TaKtRzqr0Wbn8EdvSsD2jk0v00jXUMeAeMInhKVIxojeFDizbMW27
X-Gm-Gg: AR+sD13oH9E1by/8ypwfhaTPQvcW8bYOJOt3zpIkAA8239mQ3KUtqUcq0ck0uOl8UV2
	7pvbb4P253FP6tcXSJsuLxEHlJuTPFOUn8roWZ9AIDzGaDFiCRhU/tzHRmIsyIvdNZEVmIWNJeF
	guj2vBrGYAu4Z/gClG98/v1WOa8IL46epAIta7MZN7EX1CseA0aB6vZfWHwqF6I8EA06IqpXtkF
	Nn9Dw4Gshp7DPxALRAN0uZg3Z6K2tj2W68UOwcrXVTbtpohHUj9VJJcYgTHFYFZyFu1GvdulkSY
	SI0RVK6KxaRMr7F9C/wFW39wPJ7lGeF0WXy1UcfTbCMlbehnx7guG0Hc8Fds2fieppyfBTSIW/D
	+x4kmw4rwQa9CQoNlRBF8/WU=
X-Received: by 2002:a05:622a:13c9:b0:517:7e26:36a4 with SMTP id d75a77b69052e-52e42377d5amr46460411cf.34.1787742985734;
        Wed, 26 Aug 2026 04:16:25 -0700 (PDT)
X-Received: by 2002:a05:622a:13c9:b0:517:7e26:36a4 with SMTP id d75a77b69052e-52e42377d5amr46459861cf.34.1787742985277;
        Wed, 26 Aug 2026 04:16:25 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8ea6d0sm4577843a12.13.2026.08.26.04.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:16:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 13:16:02 +0200
Subject: [PATCH v6 10/10] MAINTAINERS: dt-bindings: Include dt-check-style
 in DT binding entry
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-n-dts-style-checker-continued-v6-10-f270b1e81f8e@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v6-0-f270b1e81f8e@oss.qualcomm.com>
In-Reply-To: <20260826-n-dts-style-checker-continued-v6-0-f270b1e81f8e@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=825;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=dKa0bkhQNHGF3ECM0RaphHFXMQfLxiwcJfDby9lcfX4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqjsr1909//R6zVsjNOrrTfg30ItAEiN/ACIMHe
 w5g5T64MDiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCao7K9QAKCRDBN2bmhouD
 1+9kD/9WmOX6fI0ItOVWHDtMjEGNbamAIdvbyWI32PhuHv3K9TGohZ570QX6hAc5bXhst+sXeWX
 xLqy2cw0iKEClcs7fctBvYTT9HvRK1V7n+TfZ3vQUV6VLqqeEOM+tZosRWhGVZIF3S2hhvFTQTv
 w5cM2N4ampahDJcdeypVmH6A6DfJ263GODrE6KLSP56H4Sl9pxzNpq9xrgbp/pIM90x2uv8DY6n
 2/66AMMc5dXgRWqUrzno00m0yM/9Jn1bpf1XlvMp8UWsJsL/gX/RfncZmwgOStXP6Lpkyvv3jdE
 Ri4nK2TeZYx6C3hFAPZ3SHvO7ug63T1xF6p97KkdXqPHPafY1l4RUi0qcoEWVLobumaCw8yDlLU
 3p6S2mhd6aFl7zQjSc5KlC0VjyOB1yBuIQ4LgVQpzcJHdMvPRhPFY67yb5MZU97hnosBgWtlvq5
 6O6cCh1eGtLEhNwvCbusz/ISYkOSAbmnH6KR+EVjN9Xl8q/T9e8jGbvNFNhGkv/hE2VGy19VWwz
 PlTrC+Q6zrxhAsadfb7dUEpXSL9v9wRAZTWTNrok59x/33pDreDOVxLmMEq509Vs2XGFrldVPHg
 UrTOgyS40rUgduG7wG+Yl7tTyTd6jPJ0ZZHHphTYkzPZ14h+bfyFDXJq34sTLa0fOxCDC8sxTIS
 QdhVPnlkgb+A+rw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5NCBTYWx0ZWRfX8AWcSuo5Y4RS
 m6a42+5NksEr5CsCB1q8h6r3okrgl9WEBs038S+8313+rlIa2y/hEl/tUWS5SHstANxA6YMxsmm
 IVL62npq9O0ien/tiludG9yp6WRM9U8=
X-Proofpoint-ORIG-GUID: RXDNz8qEQXvvq9AZLzSMNfjeWddT5Cxz
X-Authority-Analysis: v=2.4 cv=eYgNubEH c=1 sm=1 tr=0 ts=6a8ecb0a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=hdCJvu6vi-O6ykQZt0QA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5NCBTYWx0ZWRfX3lIKfF5a2TiS
 9prf3V5Kwj2lUvB80Sd+23vpUHf4Enp7dcSn8D2rUd2G5N8YWnFju53b2IPxQIPicZ0B/bWvJYw
 cNnoo22R2iKO+FCrwDGjSIk1elVcFZvQHIbJWiRh00UW1Uc/DnqEz5xK3kAQdeSRiki2VXnKRAb
 0REj//tmN/bZ45DBk0LFYoHqo+gpTTFQ/S/yciiToDj4XjUfM18THJ5IGpPO9G7lGXwwKq0Sy+O
 D0UPHAMbCGNJ2suPFbyetllceWKyNVfJTwRn22bIJPdFCsA/yChHw7z+vtDz0nJc1HDrlstXZVy
 9tHni5U4V9Z15HSt4zhigavrPox53zPx4JJZokxxgQR8nE2G2VhlHyxCObKAvWIT75HEaXz+nlT
 SFc9sAZERjcEfNZjxoi1rma+P0HzijqNu1dcTBFN/mn9NESB8tlH0RxeqpKgcagiXNlBlgSYlEG
 bxcs0UM5GsRygOHgvxA==
X-Proofpoint-GUID: RXDNz8qEQXvvq9AZLzSMNfjeWddT5Cxz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260094

The dt-check-style tool is in interest of Devicetree bindings
maintainers, not only the driver OF-core (where it is covered through
"F: scripts/dtc/"), because it covers the DTS and the bindings.  Add it
to the DT bindings maintainers entry.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fe10d29b7657..59ec34fc9682 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20488,6 +20488,8 @@ F:	Documentation/devicetree/
 F:	Documentation/process/maintainer-devicetree.rst
 F:	arch/*/boot/dts/
 F:	include/dt-bindings/
+F:	scripts/dtc/dt-check-style
+F:	scripts/dtc/dt-style-selftest/
 
 OPENCOMPUTE PTP CLOCK DRIVER
 M:	Vadim Fedorenko <vadim.fedorenko@linux.dev>

-- 
2.53.0

