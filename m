Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1171239A079
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 01:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789523679; cv=none; b=JpvmxNLyppyv8ZuLmWkCTjiEjVku+RNxfHC7oUQDKCQWiaMH5IqOM7OKMiWDYwmHp1eEYz4NyKIhEoX6qAgZ4Rd9B9f1DWqbMzgm19J06hRKhR8werWn3VD+3GLB49TlxBQKsc264WVrAU6iHcTdHceQwCb3JDxTX1pR8cdkQMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789523679; c=relaxed/simple;
	bh=trtKqQH9PGxNue+PP9ld2h9X34JktvMj0tHJlGOwoOk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M1MOI7QLgItuYEL8Muppq4Nl2fMVK6tEOhLJZcDi3q3XhTpECM4yOlb3vtX4mBmkvu15rF47AWH8QriIlPF+3PDFGvx1r7kQTKKBkd89q5PoNxgwHk2eAmlMmpW4bbLvJ6wBBSV0OqLDTXWt74MUbVgJahiXmJ3ZseLrLgGAFMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bko4pa2J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fQYAWGhf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bko4pa2J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fQYAWGhf"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FNcx981580280
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 01:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=t1aitCWiDfDBe4GB6MgYwB
	htUQ8H3mamaGIa0BSdgCg=; b=Bko4pa2JV1NXswj+hv89dONSHftmDrQjt1fXsm
	mCW8H499qknuKQ8x24lA3U0s94eq4Lhr/C7paSeGjdUfGi3xayHQM8Z6G0/3/m0o
	dEDku6OJq/M9xoXwH6TlxTor4jiSXXaUl36sTQXfyfwdiw2Qzs+KliNDcb2f6oFH
	FOKKih2qf0F5ISlwPVdFJ+c4HW+S877y7uF46uThGklg6H4XBOzTuDtf9ZnAiqu9
	5i/hQyXsVJYbv1cx+sRMDuZDdvUDAV8RcBvC1I5epInXbGa7IMXjFkkUa3aulRT4
	OKDcnNuxzd0bmyHCEa/SSdvrEnuF0l8OzTzP/VTl9l6yqIwg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqfvfgbwv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 01:54:27 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4c5a1a0b54eso5813901b6e.0
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 18:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789523667; x=1790128467; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t1aitCWiDfDBe4GB6MgYwBhtUQ8H3mamaGIa0BSdgCg=;
        b=fQYAWGhfKAydIhLX1mClbEi/OXIBkzUVSa+iFw4NLIo0p0HXl+jGmk4ex1PbYRz7V+
         wmCsIDKdu2Gk4MkFUQE80nAUqK7VLt4l2uL2Zkiih+7Z4xOXanKaQDQkSbC/3uueu/7X
         xZZgohLAL/KLQVDGJcXnBU0ej5uySigvc4Esas4zrN8L/3z9t25TQdMI9tou5vnefrQ2
         TRTzoy9xSsPj0ZK8Jq0UOQa55Yh+Bqot1I8nKc/cEufZMSOEPkwmIfjodMQTSdrPwUoA
         rCREQXsiKDDEHGyvniyYXwCNaEaQiw2vi7oqwTBhyjy1fBuuJV/tWSGCM7xcft9vqkzF
         koQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789523667; x=1790128467;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t1aitCWiDfDBe4GB6MgYwBhtUQ8H3mamaGIa0BSdgCg=;
        b=U2jZPQsprrN2clM7844DGfUZ43nTZjqKV5TN3ZO07amWAf9KksnbBsS7pxrjvqw7GY
         dlfJEBnTBeAxEQfdi6ofxOnmQVgIiBmuZhRZMCa+pQMmXypFsDy4ZYptb0SfWrrUisDK
         uUaVi6kuhQDsQt4zK9k2RQfRgER0DofQ62ZIoXmwqYH35o+HS3hyysIr0YVkO9FFwXOg
         9R2YUMl0vmtf6le8ubPjK/XFsSmc5/2rPq1jzFHgeBcyD8VbCJSuXIC7t56rpM+PA1t5
         xoW+OWqW2yhj7i1s0oiPEN+pCJnpJlkiRgNyowxiCL+R42o77U6lfnvS6Y/E6+yh6aRg
         asvQ==
X-Forwarded-Encrypted: i=1; AKwUvByBb7JECKkNNa4gqlTJIGIx6hS0k2goaQou43HMI3dlURQYAKTiE2uvIm4kKkDTAO36Jpkypk0/ehht@vger.kernel.org
X-Gm-Message-State: AFuF++lGemHDngeDxXXZeZVb6Z9Rpi57jrY19NsrFqKLEk4FqazOi6AK
	pcYrijJ8cqMBmEkIv3IXlFiRUQYlr2NfP6BkJtjRBjNrCDZLvwXc6yeYtA0wvA7FXpyZaZtDnXQ
	IKtwte3kTfu6q7BYHTXrO1vHNQ46nAPs3v+7SapEpi8cykXrJraPNmEgR4xGSxbIs
X-Gm-Gg: AYBFou0CNhKb/79cQOP2Tv9QLmx8qIi9nW2Idw+SGlWMgpPe/T8vWjakz/gPJGRq6pN
	1s2xb8CvrNqMOhSFEIjTDjzYaXTYtx9AdI3J3ovEWcCykzYGm9MeYPlY92aTfYieRVAHfG48jcp
	EGIFdl/3U6pUDIlHQ/ptuy63F6KEyFbPJvKHCFcKVhLNwz3EVt5QWgqSgBein3w7Qf/0svLVce/
	RQpuMW5aQvN0iE1Pm2VnoJR6mSaCqe8rgHIbGJDFB7PkoL+bXLNXq7toUvMl6eYRXoi7xpAysBa
	10hHcQHmGcNK3/L2LMIch08jJ2e8VwL/X/3Xxy/KgPolZoh66Y1B9uEweVcL1fIVzAgsONoKD+S
	VirynVmdvP7pT+i+6WQYnlbs=
X-Received: by 2002:a05:6808:1250:b0:4c7:30a6:97b9 with SMTP id 5614622812f47-4ca4cef5a31mr953961b6e.38.1789523667293;
        Tue, 15 Sep 2026 18:54:27 -0700 (PDT)
X-Received: by 2002:a05:6808:1250:b0:4c7:30a6:97b9 with SMTP id 5614622812f47-4ca4cef5a31mr953901b6e.38.1789523665735;
        Tue, 15 Sep 2026 18:54:25 -0700 (PDT)
Received: from [192.168.86.45] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ca1e09ab74sm1283039b6e.0.2026.09.15.18.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 18:54:25 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: Introduce Asus Zenbook A14
 (UX3407NA)
Date: Tue, 15 Sep 2026 20:54:21 -0500
Message-Id: <20260915-zenbook-dts-v2-0-41de8669a7a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NSw6CQBBEr0J67ZD5JC248h6GBZ9GRoXBaZioh
 Ls74NZNJS+perUAk7fEcEoW8BQsWzdE0IcE6q4criRsExm01ChRG/GhoXLuLpqJRYW5VDkelUa
 EuBg9tfa12y7Fj3mublRPm2JrdJYn59/7XVBb7785KCGFaTPZYiZNppqzY06fc/moXd+nMaBY1
 /ULvftLqr8AAAA=
X-Change-ID: 20260623-zenbook-dts-b69019671266
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nicko van Someren <nicko@nicko.org>,
        Chris Pouliot <chris@pouliot.me>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2561;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=trtKqQH9PGxNue+PP9ld2h9X34JktvMj0tHJlGOwoOk=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBqqfbQHOFYzZls8KSt2G/4Gsmh7hMXvxUlS40bn
 wkmKYbqt2GJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaqn20BUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWxmBAAtvjoTovvcQKVgxd+E7hE1pDYENeZsV7DuwmlCc9
 NZ/EU9xJOfnl8Gzwq1yq6ji4CqIa3wT4Oehdvl7YlSZ8MND/cHb+oKymzkhFOPkwbxbQrjql5Pq
 r/wVde5SlErfpUQfnFeNSHsI7o5qjv32F+McI1zZbsODYQnjaW9iO8UrnGXfsJmSG4V1aHtT9WP
 nZpMTYgzNz3mXWnH5ppZgzplWW6ysuQS+QTRhlYzXFuKW4bDzThWvNFcaMN4CI3lW1PHLEJsMi7
 FurEZ0HAw8MiaMrq53Eu0fPUFlm65zLfD1gBn4GU1KNg2v9q3LM1GHG/xlOyy78RoyMErBgUlHw
 N5cC3X3xXYJXOsNAfK+1Hq9qoWtln82BpHzUMoulsYgBLXCECzEH6k7wzu3xANjG/Zcr7gqg5+S
 1UtPq4nbtje6fDBf4KNcwnHBH1c6Ud4+8bgJ/WW7Ja95kNdIUseknDVeC8gHTz8vnDxoxjpHp60
 wP9scSHBAQIuneeTVX3FidSSYTam3WwahdW8tRJV1DpDfYLVRI73JZW3NHqNOVeOa5OXJuJxPCJ
 MPFZq4jGmLkQXb3jsX1R5cLYRBGFsVXQhyf1g0KpNSgdvFWrrMKVdSdb5wur5GYmyCcUfi5s91U
 gAWMf3kb3XbOQwq5dW3Yfxuyk9MpxpCyJ16Ae0EUpY58=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Authority-Analysis: v=2.4 cv=JYkpPkKV c=1 sm=1 tr=0 ts=6aa9f6d3 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=bC-a23v3AAAA:8
 a=GOfOgpTQAAAA:8 a=DtrHxg6x1EAEsTDm8toA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22 a=FO4_E8m0qiDe52t0p3_H:22 a=FETSgX_rupNeA0tEg7_S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDAyNCBTYWx0ZWRfX8iIPgZ2fNgyk
 QwkCv0LOxlkfzmnrEu3wn0pmFeL1OVUYkMcOiRG5YO2eUtZcJLhUvwKF0Wirzx9JUPx62z0sdtQ
 zG2hdqz8wW+syfuUeXQogaQhrOQPGzQd+cLYk647PNYcBzbyAl0wfuSVinadv/SFkXaELyy9deP
 YwOA+itAF2XJiREAi0Uxjt+/nsXc4KcoEOnX7NJUfLBOyHahC2pEiWUIUHJDO0i0gr2NgdniE1Y
 /qwJrblek/l5l0ohQAQVzHc1vNlzfHc66pZGCqahSXxilw5h+ykfL/rMehkFdAYKH4KknEV84JQ
 eQDpjE13NkbyAmAlNU/bswpznQrItN0fGEMlWWHJpCdZYu11SBu2Jm8YQyl/1B3m0dJRboOdhLn
 TtUbLWAZ3aRV2X5fkORJKhEQYo/1QgpzRB/Llh0KBfBi7tf1g+pf+QjBr8C2TKKPQr7FiC+7Yk9
 8/RQ4O690bZNsq9h2sQ==
X-Proofpoint-GUID: bj-C7GBtK3halXz6V5TLQ0pXoTpjmLpB
X-Proofpoint-ORIG-GUID: bj-C7GBtK3halXz6V5TLQ0pXoTpjmLpB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDAyNCBTYWx0ZWRfX9LkzUdf3zPdC
 4Reh5ZARL++u2uNJ6lvDvQbxvDVG2ebcu8FFj94/saaEfpakKOoCJNO/ftRAP0VhPDUXsMrenn1
 S8UTn0uKz8mHISeIbsLx3FpEHRO9LS8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160024

UX3407NA is a variant of the Asus Zenbook A14 built on the Qualcomm
Glymur platform.

This (v2) remains dependent on the eDP support here:
https://lore.kernel.org/linux-arm-msm/20260622-glymur-edp-phy-v1-0-814b45089ac9@oss.qualcomm.com/

As reported by both Chris and Nicko, the A14 only has 2 speakers so this
has now been resolved. But, on linux-next I need to introduce a
pm_runtime_forbid() in the soundwire controller (swr0) to avoid SWR bus
clashes when trying to play audio.

UCM config and audioreach topologies can be found here:
  https://github.com/alsa-project/alsa-ucm-conf/pull/858
  https://github.com/linux-msm/audioreach-topology/pull/78

The power grid was revised since v1 which removes the crosstalk
previously seen between eDP and WiFi TX - which means WiFi is now
functional (with the right board-2.bin).

HDMI remains non-functional, patches for this are being prepared.

---
Changes in v2:
- Dropped chosen {}
- Protected EC reset pin
- Added camera, mic and privacy LEDs
- Changed WiFi/BT to use the M.2 binding
- Added a bit of CMA for good measure
- Corrected speaker descriptions (there seems to only be 2 WSAs)
- Added missing redriver definitions
- Rebased on pcie3 PHY changes
- Added tcsr supplies
- Patches prepared and posted on the Zenbook A14 itself
- Link to v1: https://patch.msgid.link/20260623-zenbook-dts-v1-0-3f80f680381d@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Nicko van Someren <nicko@nicko.org>
Cc: Chris Pouliot <chris@pouliot.me>

---
Bjorn Andersson (3):
      dt-bindings: arm: qcom: Add Asus Zenbook A14 (UX3407NA)
      arm64: dts: qcom: glymur: Add Asus Zenbook A14 (UX3407NA)
      firmware: qcom: scm: Allow QSEECOM on Asus Zenbook A14 (UX3407NA)

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts  | 1140 ++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 4 files changed, 1143 insertions(+)
---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260623-zenbook-dts-b69019671266

Best regards,
--  
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

