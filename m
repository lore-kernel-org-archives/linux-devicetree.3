Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6ED530ACF1
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 14:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786284510; cv=none; b=UuU0C135SMQ2Map/8OtAvoffQhIe20E4xgmP4f9xHLhGdfMg7p8nC30DgkxbsQDTbBsUrD53yhjygqG6BSRh5v9EXq0bd/flHzgdTLd3PzT4HqWM67dtT5jUBkOauYbkWqbI+9sZgchZsvOHcwcC/YW31kB/XO0GIm/heMRm96w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786284510; c=relaxed/simple;
	bh=iCfa7typSMRGPLA0CmVykjjNKAZSxoG8rga/WfRD878=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FIpeT2D8A32xmJqaSeIaVVeWp9cDO6Jt3wNqvoPDARsKyBl6i8OvfkvP8NyJYEZ4EPU8kmkkpv6UCVscZMO5iarJsFTbQuS/3wGNtrOi3GEc07C/Bnoxea4yPF2OWgUHi92DdhQqmId5cnLvtABhgUOlSXxOsdrHQn97WAf3NS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KmJb+W4/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wv3FULkw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KmJb+W4/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wv3FULkw"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679C1wFG2687535
	for <devicetree@vger.kernel.org>; Sun, 9 Aug 2026 14:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=C9G5sVV88ftybZGBcthamF
	rq5LemHvyV0Y+TsXa/ehg=; b=KmJb+W4/pJLa5F10bsOJ5KX/h3T+mUA+veubrw
	ZcdLiF3Op20U4IzOFXoivWswLZvrV9WUuR8AR2Gvq1BdRvrH2NIWo1CwuXbC+k00
	UjFc18/oWbyIRI6LKxk3K77QWZN4sJqYit+Dxhohh5d24AbDdkeX7WQemVp398X8
	r5Xop0uixmKEAJJzZAMuCdGKERpzic4rMTL1jRjDDmgql8/IpCZfeZbaPYhPYulU
	5MEp/3so20PBnlWLTY7p68P+S3MknmSIU0TyUfTrNEV31i6W1EUrGbn7+ekpWM6K
	4eRNhzbiInJJ9z+JWWJmW+OlEiBHHKRktRCShJ0r6CNWppdQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwstp3974-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 14:08:26 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so875847a12.0
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 07:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786284505; x=1786889305; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C9G5sVV88ftybZGBcthamFrq5LemHvyV0Y+TsXa/ehg=;
        b=Wv3FULkwLKSYQ+UuWPFo3/5JZbb+1k3qDX7lfq9iRwcoe9VMdY2YDesezIxfLSUY/n
         kne3eaCUCcEwtxJCPfro7oeuVkCFIvkGd5xJNZqnEyU+yQXDz0U+kLGw+75FernEWaWX
         J4UXLqPWhYuT+qb//NvXzWwJN76ni+Hq1WnfXXFUl7W3vnXcuX7B2Ul4ijZhJuuqEu2a
         5ZIXH9K0dQNBH1McHwk/0Y7giO1Nzrbom6bSlLqnwpPg7LlVGm9scbUvG+oCMcKTeVly
         0mL8Pah58Ps+egxWqL79iOTQ7Bi99gEuMcGoe3I5iDCN4OM1ZxT7LCfvX4g2VWmoSCso
         oSxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786284505; x=1786889305;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C9G5sVV88ftybZGBcthamFrq5LemHvyV0Y+TsXa/ehg=;
        b=UcTYA+cjD0oRT0OMMGqTD+yuxrEJ6h5z+4x2YP8CajCuPpyvOM3Qjtho267jfYRJoe
         JwseS2rEQKxLnmsrXCYk3ky5+CpLGzQ0TJyCn41NT0Ik1mUs/sUQ5APsKC0Rj0/xLMZN
         +5bPMKXEhbSmg5pN239rBO6NuZX84eJ9TDBVOevYRHbf8HpQkKH+0zJKrcuDkmMYPjfq
         WH7QIgpFqzRMnuRtxpjg1EhdJeA9njNP1UMk6RATpOoCv22i9fIHN0sIHRrM1sGKYNsZ
         RCT/StgPe5ovq/d3I48nH6r4Mo+mTagjO3AT/CJC+LcOagKeyMHMR8VPs+0BbBhB8xAe
         +ISw==
X-Forwarded-Encrypted: i=1; AHgh+Rq07iN/tXYzqxvID5wgBu4EkXlhqOAnVLOpX2iqeF9rf7v6EEGxtiOzUV4ShtUur7SH+4A7kVo0g0HX@vger.kernel.org
X-Gm-Message-State: AOJu0YxMVvLUwHNYugvotTbqwqienOCybzIt+TglW4BZAlVmDN6lq/Yd
	B1frjLZtSzJTCyjzrgU2E5iWgib3+2mj7roKA3QafHqd30g3S2V18Q9eUNaXNRrOFe+P8c6IEGA
	uMbV/bbNUyODWCRGObE9NJVjg/I6Lm1jhl/lA7pO9YwZ/n5DublOl3RZvho3et/Ga
X-Gm-Gg: AR+sD12eHH4JD8FeK2TWiLOYSnKnN5O3k5HPgEve2hYTfAK//2PG4ipOf6sAPggyb6v
	gstuWYW1Ln7tnFSvneFDMc+3/iefsUsxg+ijgI30T1tmkeV98Rv/fFbS4ehICT1E5K+fDrDLXcJ
	95n4bS1SCo94P3dDtTM7yeCx8mmukWQ6CCuWEQWL/Re4jrmpt53yBicchAa0pYZz3E8zseu5rlL
	ruZzWB4pbsloDtlMcs/YSdVGgx8UT0pa9hKm0vccKZhNKSOeR+Hvs33keyjAKBpARgQ28mdPN0j
	DzEL8Ie9lCH4lpsxzrauyw5L87pWGqk36uL+LDw0aFVPiYoQnMeVPyzSgC19Nnz+13KFeRFAe5e
	Om0LG6JwVE45VP7LbI80=
X-Received: by 2002:a05:6a20:d52a:b0:3c3:bbe6:95de with SMTP id adf61e73a8af0-3cb85e99237mr44740069637.6.1786284505112;
        Sun, 09 Aug 2026 07:08:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:d52a:b0:3c3:bbe6:95de with SMTP id adf61e73a8af0-3cb85e99237mr44739992637.6.1786284504643;
        Sun, 09 Aug 2026 07:08:24 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b4eabsm25489437c88.6.2026.08.09.07.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 07:08:23 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH v5 0/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra platforms
Date: Sun, 09 Aug 2026 19:37:50 +0530
Message-Id: <20260809-shikra_adc_support-v5-0-bf6882d18bad@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALaJeGoC/33PzW7CMAwH8FdBOS/IzWe7095jmlCaOGs2ICVpK
 xDquy9lk+BQdrH0t5yfnSvJmAJm8rq5koRTyCEeS5AvG2I7c/xEGlzJhAFToCpOcxe+k9kZZ3d
 57PuYBgqgGyUBW60sKQ/7hD6cb+j7x2/OY/uFdlikv4mEp7FsG+5jXchDTJfbKVO1dP/dOlUUq
 NROorLaC+3eYs7b02j2Nh4O21LIok7sLmloViVWpNo5w2uvW8+fSfxBqmBV4kVyztYCvDVg4Ik
 kHiW5Konldwi6VY5VgjUr0jzPP5REhfHAAQAA
X-Change-ID: 20260613-shikra_adc_support-0079650eb76c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786284499; l=2295;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=iCfa7typSMRGPLA0CmVykjjNKAZSxoG8rga/WfRD878=;
 b=xzkh2bKcsJ8aplcwMUGz1qUfNlGPDNGa3OBNzPvHdu7R6hiwbLLZB6lRPSuSLyIjO8zBc9H/v
 sRHdpi+eXXmBEOFhNr7h/D3vhthI6t1zE/YFmd5SWsxz+Bnju3QsK4/
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: 1WJxgpjZpw5TEeM8Pq1vTLN3FnQR6pcM
X-Proofpoint-ORIG-GUID: 1WJxgpjZpw5TEeM8Pq1vTLN3FnQR6pcM
X-Authority-Analysis: v=2.4 cv=CMEamxrD c=1 sm=1 tr=0 ts=6a7889da cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=Ehwq6YvRiQ2Q07RnrmwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDEyNSBTYWx0ZWRfXyaTb/nBE5yIl
 NERVmKGnOKwgrSMcjOIddzqFjOvmbVWi1IpgVM96jd3b7hQH5rzr5gIbtsMveD5XzNxAEsqGuTm
 /K4t3HrZlWEuRVyhJzxht/6RDCzFjgfS3f48i5mK6p9SymPtSie+0TjeiogiaGmqQkFtgzaewcR
 CWlXTvaI8V60GO6n9k1na6k7JMgEuBYkGxN6sCz0uRTPJ1IrsKjbT9FowSaR1l69iBf+r22cvKJ
 aUlGmUyFcY5q5qlFNLuL9DmA4Hx2E5l4VdaxusNZ6u6Kr4VYSmQgkG41j5BGasvVmH8EPTD2jCT
 M5MmDGwO70t9+1swHhQsM07tgN4VYJnKKv2ftX8I6I6ZrGSu9U/yVJd959CZuX17fV9n0CsVXhz
 hjMxRowOslyhMTJvTfmvx8CMILJXLWM2rT+teRWpOnIvgGy9Dd+DrWtfQHot7i50zJ6PHP7BFSD
 eIqkrVok7V95u8Of8uA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDEyNSBTYWx0ZWRfXzkYZNCPPNHzR
 jWeYLInkZzDMA1iMTsJS7ywbBUUe5xFq6BgCWAeddJZyNk52OGpy51IbVK/a1Ox/qjm1AMHqkZK
 YYx8fo0+VDOREGc/VDOLNYDdH525arE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_04,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608090125

This series adds the following:
- VADC and temp-alarm devices for PM4125 and temp-alarm device for PM8005
  which are used for thermal mitigation on Shikra CQ2390M SoM platform
- ADC thermistor channels and thermal configurations for same on Shikra CQ2390M SoM
- ADC thermistor channels and their thermal configurations on Shikra IQ2390S SoM

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Changes in v5:
- Collected Konrad's Reviewed-by tag on patch 2.
- Rebased to latest kernel tip.
- Link to v4: https://patch.msgid.link/20260715-shikra_adc_support-v4-0-5e07b6d21429@oss.qualcomm.com

Changes in v4:
- Collected Reviewed-by tags.
- Updated the pm8005-thermal trips to hot and critical.
- Link to v3: https://patch.msgid.link/20260710-shikra_adc_support-v3-0-ddc840fca0a0@oss.qualcomm.com

Changes in v3:
- Dropping the polling-delay = <0> property from all thermal-zones as suggested by Konrad.
- Link to v2: https://patch.msgid.link/20260709-shikra_adc_support-v2-0-8dda38f7bf3d@oss.qualcomm.com

Changes in v2:
- Move thermal zones to their respective PMIC files (PM4125, PM8005) as suggested by Dmitry Baryshkov
- Rename generic-adc-thermal bridge nodes to therm-bridge suffix (msm-therm-bridge, pa-therm-bridge,
  quiet-therm-bridge) as suggested by Dmitry Baryshkov
- Update commit messages accordingly
- Link to v1: https://patch.msgid.link/20260613-shikra_adc_support-v1-0-57d5e6c7f47d@oss.qualcomm.com

---
Jishnu Prakash (4):
      arm64: dts: qcom: pm4125: Add VADC and temp alarm nodes
      arm64: dts: qcom: pm8005: Add temp alarm node
      arm64: dts: qcom: Add PMIC thermal support for Shikra CQ2390M SoM platform
      arm64: dts: qcom: Add PMIC thermal support for Shikra IQ2390S SoM platform

 arch/arm64/boot/dts/qcom/pm4125.dtsi         | 104 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm8005.dtsi         |  35 ++++++++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 120 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 113 +++++++++++++++++++++++++
 4 files changed, 372 insertions(+)
---
base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
change-id: 20260613-shikra_adc_support-0079650eb76c

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

