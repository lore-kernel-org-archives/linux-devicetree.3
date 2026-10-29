Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793298835;
	b=KF+UhrmzKwtssRoKH4QapB8ucdBmwt7rT57l/tzb50r2N4Jr6TlBBk0Cc2YQNkuf7ljH
	 lmJpG89oe5dvSaaOC2PaGrls76iQ72zfkHDRD5pvYjLqninzXr3SctUXXzaIGXVWajGa6
	 kkHpy6yHGvIOAKHplzm4HNsYYFahZdwVT/NDg7g3eDtRiiVrQkWwFyxySInR4mRKUe8no
	 kO3p3r2O4FJNbxonbsWBLSN9uvL2rJC5xfTFfjxO3nIQtSW22NK7Gtfd9rbtqeNunxWXS
	 YEkvOVb6tMkqFrFwmqxvINCexqUmgspo9snIU8mDFHr8oeAOWexWKRzKJsT2wg2w+UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793298835;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lDtTbVbyYNnlkmw4q3bNVv9nL5pJLpez//J97uSfoTI=;
	b=gqjiDfLQRUiw0Hil6DbdkJoiAU30bjUv+Af9onORDWiEstzYatBP3EM0qIyQGNXjOaU6
	 h6fotLbor4uZQGMrN5iqE3dCRhqprut7gNtc2cPGwiGDPHO1FlD2LzN2jFRAGplk1adkC
	 BgcA4UBwlDajBI/ohXJzohOoxs39QJWuMYLy4g9lk7OTspIYhtShEtYeZgmdGOb3Y7eow
	 GILgKBuPwfv0Yr47OdEFrcQ4urCi1EQz2IOvaw+O7bcBebDdQx2ayS7gQZjtcKDkvx7dZ
	 62efzy8u7cTuupS9UWj94rmQ+d2MlgMXwI6zw+/UlhDUlQ26YiWutU/Mjk+cFiSD+JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gesxsjQu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T7jeFvKN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF28606A31C
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECF28606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gesxsjQu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T7jeFvKN
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDI3W1654937
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:33:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lDtTbVbyYNnlkmw4q3bNVv
	9nL5pJLpez//J97uSfoTI=; b=gesxsjQuwzLbvq6Cs8vMUlB1GXsxgtJh1kBhI4
	cwSVEpfdZFPNH2w+Mgieq9GWq+KvnRhEpD94nzFmaehIPyLDInvCFGG7mRBIu9jd
	jWPw1eEqWWC9ri4OvWQuZnVHu7vflAhYH+dy7LPLn7SJRjjrxcFzPCtDj7bwuPpW
	/L6JpQPDabTMdvrBCVjyM7EeaJckEnP0TNPipekt98JHUF7beHQdlqryCOLijUQx
	DoJgNaRAGvzZW26u93P6L30iZ7HrVjyO8IosiUfgi0adTjl53dM0+oKAPDQT63nF
	gRITb4z2/I1dzFYTohNiRwAR9JOV3oemNZbQ1lNXcNTywiBA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm4a226f6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:33:54 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36998507c13so3440853eec.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 11:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793298833; x=1793903633; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lDtTbVbyYNnlkmw4q3bNVv9nL5pJLpez//J97uSfoTI=;
        b=T7jeFvKNqQaMblyH7RXktRHbANi5C4ZexaBo4c/1cFGwzb9DfA5W7igf1jM2UJx6q8
         T6TjxtKeW9uewAymnAeQNJkhX+2yX8eRWzn3wVGx2QwlXzeUhKBSeRWJHUGBsARh2Yzh
         XyRpP3JUkCC/5ek4nGetpTVKKwjLj1dhrH2ZgIdsDc2+2iS1mU/g0xBnu63zQjMhhujz
         A2qFHN2eh8XvgzbMNK0/kppDWQDFn6Ykk1aSvRgDZa49wDYCmdpsj/E5uYhkGDgRGmkK
         nmmAHrVU4qyy/2/0iVMGtPnPTWmsRNbkDrQa5MvIE9EjbQBx2yDjcBWeeruvJjps+UgI
         rauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793298833; x=1793903633;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lDtTbVbyYNnlkmw4q3bNVv9nL5pJLpez//J97uSfoTI=;
        b=P2WERokuDxa9Gu1TEq0eBouS+S7uWtlpPBdRqxVRQzsBl1c8MLkMKiAnvOq/pXFWtZ
         A61IrQ9zIQew5kh/1F8mDNyDdG2BkT9tJw52dhVQHxo7jLa2iaiOR0zzRlgwj+Jezo64
         Wi08enZH6wnkT4KmNLGs6fOFC6HMhkibxCFeokPMKRLz8hzKb3PVcE41GXeASIpvcyUe
         g3aAIlir2eZDXgBeySX2i7XaectVblCS/XLkJ5H0IWgAx3OaKuRZaKC5d/Kldu5QY6Qn
         kZwpDohOExNGirmqU8Qa4dhuhIfrfh6j6FLw2JIKcwkzn1muUvZT0zsqLwNb/fPTRsu9
         wgAg==
X-Forwarded-Encrypted: i=1; AKwUvBwCXtTCvF3YZyxUVnXAcaQXopdv+IHPObL2F+fvMfF+dQbFuwGTQQ6ntf5TCvbCB6MXS0KLq1u/KF27@vger.kernel.org
X-Gm-Message-State: AFq9FYJThBC87pII3tFLxF4Q5BCge+GoCrtwT0cQewcuJqZA5httyjb7
	TF3UKxz2Q9JNq9nLy3ulrq9jVktBGYTANkWc8Fve9grEFG3mR4IGId+NVMz55chCjtjx71oeibh
	cOyyvR+FSPtGTn7f/n+AL4eFjih2eqQ7H3xE3LHQw9ISL8FomNXtMBEbRjoPMn6M5
X-Gm-Gg: AYBFou2wOqnNAVMWRZsx5ghXBEOGJrDG5u4u9K9N1F+V6cn5QwdiSOWD7brUAddXc6A
	enHRO/zgxERh0dIzyIGwmTw7W90jKW82Zi1V+2M8BBIGQZV4I+PtzE/hLdOkXEd1CGqvmiWlL34
	lOOfT56V7nugVCMOrZmYFGl7ijnqCl+DeQzRkuoUzhjVUbyad5KrXRlfsxnKhJlXDoM/mP7va+I
	7T13J6Wr4SaWWjDNSgSCNd8S0J1oijgZx9TT42owUwigzOnzjwAe0Jj8zbwH8mBySF23i6mMFQO
	rdMxRFL4a5jPKG/b6loPi1qAut2mFL/Xn6ppWEJ3SbGd2zyQkoLLoK9ONpzBLS5/TN21NGYGHwL
	Hr2TMtQVrYB3U8N9bwPUgjG/Cd0pRif7YQpsA5Mj8RvhGshcBw12hPiyExJ5sh8hnJdZd0nKciC
	TYBEezSwNLQ3+UERrQvyimugVTj6oNVb6lCFt9VNjw9Q==
X-Received: by 2002:a05:7300:fe41:b0:34c:fb30:3e30 with SMTP id 5a478bee46e88-36a42401960mr216470eec.7.1793298833351;
        Thu, 29 Oct 2026 11:33:53 -0700 (PDT)
X-Received: by 2002:a05:7300:fe41:b0:34c:fb30:3e30 with SMTP id 5a478bee46e88-36a42401960mr216443eec.7.1793298832801;
        Thu, 29 Oct 2026 11:33:52 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a504c6sm389458eec.21.2026.10.29.11.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:33:52 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH 0/6] Mark USB controllers as dma-coherent
Date: Fri, 30 Oct 2026 00:03:37 +0530
Message-Id: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAIKR42oC/yXMQQqDMBBG4avIrDuQRCimVyldmPirIzSWjJaCe
 HdjXX6L9zZSZIHSo9oo4ysqcyqwt4ri2KYBLF0xOePu1jjPqwbu3i3HeURGWhjeGNvbpvahppJ
 9Mnr5/ZfP12Vdw4S4nB/a9wPB/jvidAAAAA==
X-Change-ID: 20261029-usb-dma-coherent-e9001f1839b3
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793298829; l=1176;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=4DZan+29ikubxEO+r+J5U3jgJ6tcstLjYAL6m7E1rmA=;
 b=RzRo8HMqpQsOenSDrTd9s7UV1CoiKsb9qVwKw2ezQD6MYoZa18+BNaI/wj73upVE2xDcEecqd
 EZh5u3bE3InBs3x9cGXUd3BlmJfOEimnBhwo1Ulr3XdXIdRO+GE6blN
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfXzFMvlmMFQz6b
 BxMv/kO/TNA0YGq8gYNIZ/9y0afbk3jIDX8wKi0f4NpC/68PTsaEy5HS+WC34pEhknUToCEFrMP
 u0iUckGZZmgdo7aaOYOOfr4HKO5iQBdDG+lQAOXZvJ38TwzBSgOkwv47BUr+x7hErfFfCHteLya
 bPh0XetukKJZExcejBJpgREfqN4PQdvkMCwRCgNfpM/sJvLUdIdTTwCuvPo1B5dQhK6M7H13tK4
 MUSWjzvjL8SrStbzGSy+8R+smiu4Q9Yu/0vlwqfIWYWl+V03dthpf5T+OCIvBajMMObZyt0AI+Q
 VUzDojMCxfZpG3lUqS+4pheiI1yQwupko+bE6SS+390ICVXR9pJeW4XzP3TJtLh/dB/cHPd3PpK
 WEp5AQDC0hMhGWYzvP7z/BWmBVzHlh6eZH3zEoSv9GK2Xev/JQCZjcgGvI8K64otz0EDoNTd3BE
 lttcVsGOYgp2KJBVAUQ==
X-Authority-Analysis: v=2.4 cv=E8tYNqdl c=1 sm=1 tr=0 ts=6ae39192 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=cCNIK-7_6ZKse1mBRbMA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfX0d6C6//ffQBc
 i+fTGMwK1dQYOj1McOaEvqOsNoNJTyQeG/hxKAGWZ0x3aPi8STc0VgIN2uLNvfUIIU0nuh8hwJb
 erm95ecNTjQjJUB0my9TxvMxHEAy2FY=
X-Proofpoint-ORIG-GUID: yGBmLcsiexDbY5HK90RPHelLY-v1tUlY
X-Proofpoint-GUID: yGBmLcsiexDbY5HK90RPHelLY-v1tUlY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290072

The USB controllers on some platforms are DMA coherent but that property
is not marked in DT. Fix it up.

This series has only been compile tested.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Krishna Kurapati (6):
      arm64: dts: qcom: sdx75: Mark USB controller as DMA coherent
      arm64: dts: qcom: lemans: Mark USB controllers as DMA coherent
      arm64: dts: qcom: sm8450: Mark USB controller as DMA coherent
      arm64: dts: qcom: qdu1000: Mark USB controller as DMA coherent
      arm64: dts: qcom: kodiak: Mark USB controllers as DMA coherent
      arm64: dts: qcom: sm8350: Mark USB controllers as DMA coherent

 arch/arm64/boot/dts/qcom/kodiak.dtsi  | 2 ++
 arch/arm64/boot/dts/qcom/lemans.dtsi  | 5 +++++
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 1 +
 arch/arm64/boot/dts/qcom/sdx75.dtsi   | 1 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi  | 2 ++
 arch/arm64/boot/dts/qcom/sm8450.dtsi  | 1 +
 6 files changed, 12 insertions(+)
---
base-commit: f5672a3dff0291d6a45eb0c258b9d2baeb4dc577
change-id: 20261029-usb-dma-coherent-e9001f1839b3

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

