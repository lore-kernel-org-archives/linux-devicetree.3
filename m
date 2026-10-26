Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793031688;
	b=oku9kftdVJJlBfpPhi67hpwl5lFKegM9qp1QqcLp/89wIHK+mikml+3uViXDJumuRv8t
	 2cO4yKPh7b0CN6ZpKIPML5A2HnvfT/Gbyk0E9DiIEHLSoDan7AsMx9buiJVWvLJqVLoiX
	 rS1lNxtQTGR8LVeeYhJiMafgModu6/E03/McpKtECFpoRoucgK4PjZmykT6qg31NQkWhf
	 cLxXweQ/lMnoz3GL0aTiovxdTy/KoaLwzHXHWMrEGPstIxqUQ4VhyjN91/Se001P/4dww
	 mcAh5u5AL2bnugwsXPUXRsM7N3oQvC3nRWgB+YLTGaz9bPNRZ3LqQcW7OUGO2heip/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793031688;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EpfIu9h4v1MmMX9uhVfYlN/QPPW9i2E36sQgqxW8Vxo=;
	b=y79BCcqrAIUtz/rxNY9fQo7Hc/0jjSuq7K4O1u9XHCV56cjUPfdN7mFPzR0KuBq8l2iK
	 X/Bpq7lfT0ILwCFCyVTpmwwB8ncnuodSLneLLg6YFdnP8wuUHVdMb9PTMsUxTkT3o/Uj2
	 O0wwj2qHwz4FeZZlQwBXBLAHbqTROIhTUirvzlJZdRimrAxYKaaZ3Bk0K4nq5HxlEKebS
	 fmhlz3gyRvfgR9swSpf5qepC/WLC5SPho5hEX9ByEtceRyAzo+Vhvbyni4SN7YxKDVbJB
	 aZmTYfxrWSsJz4zyB36ajnKEy9pRy7rdT/r4S7uKh9hAPpnSz1Jc74qB2MDGRhE8QbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HMf6z+Av;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JZkI5UAR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F53606A31D
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 16:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23F53606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HMf6z+Av;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JZkI5UAR
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvjaZ4098774
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 16:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EpfIu9h4v1MmMX9uhVfYlN/QPPW9i2E36sQgqxW8Vxo=; b=HMf6z+Av4hsat1cA
	E3TYRAuFE6bynDgGA8f71po/6+SAGAO6MDF1/HqNk7cHqyqblTeLpKvmFLKes1e3
	7bVyqoquN5l56T2gNhimVi33stpXnVhGaWQmr/+ApfPwemVjDK8ARAR5IbBYGiIH
	mST8vn91Y9x2mJMg5onTlad172Rm5x1IAehPtnbBkuVLSl4bqFBjqjEbHXh7sjlR
	whQpDJGjjNc7Rv9GxSpwUAXIsA6UpRLhOo2VTmbEiis6nte3XQT0qgA6i7iXp+Tm
	gjm5mFYVB8okc+sur/M9D2T5+8Z0Ku3mcuwmkbj3dXkT2eOyjdjFvlGd/iq4O8PO
	LcGstg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4s91g9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 16:21:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb93c874bso11809385a.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 09:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793031686; x=1793636486; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EpfIu9h4v1MmMX9uhVfYlN/QPPW9i2E36sQgqxW8Vxo=;
        b=JZkI5UARFfwrUrgZsPPCGXF5PcTCU8oRvU+BpBoH9CSUpx4JsL7Wnsk8mYaU6zczeb
         pU1VIHs05E9aDtw/iK5k1iG76ZPknUbOVfV9vq1x5cOt6aThmoaZxBiMCNUosxV0dz5b
         0Gb1WyiRx9AAHnjC11V0UQj0Brme/9mxypjhSrZJm8JlP/5r/iBqby0Sc/YUFjnxOY9p
         f7jviSZXojXBK3Wjm96LYSmZOCUOc7AjXbUiNACwqNdrhRJVS7zd8YZmF69jiBTQhKB+
         F04FU+lwu5PPuylayylaU9Iul9Cm96Qj+Xvfg8ADt90V3B9k2pvdVuRW3/mk8m4itKRS
         b8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793031686; x=1793636486;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EpfIu9h4v1MmMX9uhVfYlN/QPPW9i2E36sQgqxW8Vxo=;
        b=bxYAsN+lq6e5gJx5lCGJ4Xir6kOqolO0BUN8mITIeGUWvtqZf8M5mP24xwgNOGGTe2
         3WGqiixIV7dJhtlFDU4vWNdYrP66eAeM5TwjhaSqnOsIeaZEHlTGXbb/PAzaxF6sY58+
         YqDBFniOrUvqkaeQ9HgkGfedq0cc0quwMzRERkJ9A9C+wjwZkvUxSq8plGxnLpTZAlJ8
         aEPlPpkXkPprajjNGe7tExJCJPCSEb01I4B0tFGd7R6Hi6lCLKm7s3VfJc2pFhETgO+E
         Uvv8VUWN/m3jvVhgEpkuENdbpVDJ79KWGK1MPhLs4C3AOdRD7lcLwDeeg8bAhOm9tkqr
         4xyQ==
X-Forwarded-Encrypted: i=1; AKwUvBygski/RolyRt1cdRq4bt15adZmbQXWSrhEz7Tvyjjjc4MDDkEepiy/NyWDHjR7rWukXK/yE4PhYMzO@vger.kernel.org
X-Gm-Message-State: AFq9FYL+CtIJyq2lNWfve5Pn5tg2d5/fId5oHuTUZOrdz5NkcgPD5OWR
	n+cCXAYaJo0drF69poiBf0Kc9Th4MHbDB6s/WlCTG67S8vELARdr4fckOP2EN0aqqmsMkreBx7g
	vlKfFymFfGB8XlU4ta02Qyuuvv6UiQFX1u6jhZi0kt9dfhAqyBksZu6uzpaaxcWNI
X-Gm-Gg: AYBFou01IAjY5BAjV0QY2k3p+5rEw88SI1XPKGtT48BFuwF9Ah+c5YigmF4T90OVRpn
	DIK76U3VCfYEQoAYSGICMLEKu8SdYUoVMZIizojTOEgImXjBnx9TtSlUulxL8XEwgs5DdsyohVz
	qCWcttOX2x05Yvvqef4DuUqzsBav/kMLccaPaujDFhW18w9uUEinehTx+TlqtsBCKqLmFhIv9WR
	JoUjEmY6zfzdKaWXsfIQsdEiMBol8ukE7yIZBLP/e+UhgGKUn5HoX+SsJx/Bo2ZjbH3tuqH7PRh
	CYZPKp97RG7PlGbN3MdZ7mgoBvDywvvagoWRQ2EzUhzgt6tL8goEpzh1B6UWK7umwOZ7dEF22rb
	8+ZYwclPhRQ==
X-Received: by 2002:a05:620a:40cb:b0:93e:5677:317b with SMTP id af79cd13be357-943f4b9fd77mr27074485a.25.1793031686241;
        Mon, 26 Oct 2026 09:21:26 -0700 (PDT)
X-Received: by 2002:a05:620a:40cb:b0:93e:5677:317b with SMTP id af79cd13be357-943f4b9fd77mr27069885a.25.1793031685633;
        Mon, 26 Oct 2026 09:21:25 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb99esm16672814f8f.23.2026.10.26.09.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:21:24 -0700 (PDT)
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
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add initial Nothing Phone (4a)
 Pro support
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Oleksii Onchul <oleksiionchul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261011095221.24767-3-oleksiionchul@gmail.com>
References: <20261011095221.24767-1-oleksiionchul@gmail.com>
 <20261011095221.24767-3-oleksiionchul@gmail.com>
Date: Mon, 26 Oct 2026 18:21:19 +0200
Message-Id: <179303167977.154232.6751719629027662314.b4-review@b4>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=384;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=+BJxzzb/3UaiKcQDTKgmEhodid+jkh7uF5gQsqTcbik=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq334DjMKzinGJHiYUKdzYfyhvoZ1kX1hcG9DNr
 ooRk4ZF/9mJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCat9+AwAKCRAbX0TJAJUV
 Vlj1EADNmsMb0hjiKR7BPwXUNIwFTvxkeYgpO1OMPW6XHeOko0EWQtWqUQ+XMaD7klaaNlD8Xgx
 4KGN69Osj+KSoFFQfRpPHt9Jpayv2x+TUgfmnKw15q9zy5WaycELIn7DfEdzSQqu7CbJQwKxEhc
 2IoWZ0FcQl3JoRxZhigLXqLLGkL/Y0JfjmG+6Mqwx1XSWRzrgD7SMwaU8T5phzaH0x7i4XSx3E7
 uLkW5JJ08DPq45SADyhrziA1a5Kjfq8m8qyVKn79GGLifOvt/rQpDGjzy8PNFdtICzoo6VFg/T9
 SNCF7FtipNxPhgiQpLQyHGlUTG4fEWexPF+yOUFwxJ2Kow+jfRvDdL8FWvzSGjf9XCqtIicMFMV
 7HyqChaVMHihMLMEQ1oVcZ6s+ODr9/20Ls69tKJmCk9yVdytdpAJWwcrFowYeYxkDy+Cjc1Ojl2
 7dEhwwJphPtCWkXZT2v9lGD1E7RoIK4YGI8XZ4KPLwrigy4tGN9VP7UbsqE6fKYCmQ0d3YrcuGC
 5Nfg+kc6tcFzyFMpjfagSi28vyEt+CRLh8tPrBh9ywhgIjCsjY4lbyk14KySB+vKDvEvlTF6qh2
 VD8XaMVIxn/JjfRgthLosfLOKPJaU891pZTByX/LvibES8F+Ugr4CwABya67jImz45jugpNK7CD
 BIcyPxY/i9vx0GQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2NSBTYWx0ZWRfXxQkyNMdUTlqP
 hQZHJWE82qw9m/m5wzXnot5khj9qgFQqnZX2utpMhlyPkPfBcTJtGqT7n18jJ6Y5wGoHQnWMtA7
 DvcnMNF+JfoXXd4ISJ2cKSGoEvOa8Gp3PqSQIqraf+KWhdDj18AoFvuUQDL3h88VHeqMjTXEwqq
 WDJxyV2ikp54f0TlKrzuojjxsftRFSgDAZkxv6BghplLTiua9Ai8RaxQ9GRCYAiAytHYISWyFPa
 pzrY2hJmmDjuXTWR1yefkLPTPrFEwVyNsBYlbG/BVQXbu9mym85eqGq8hpFK5VB9+KXkm2SaiDX
 MpCWT08V1MBxJMSufEbVd9yqcjbFr7caeYI+GoP/4NVsFIzlJSPqKYr7D3828cn6Qv91/LU1Zqm
 bTIdxOapzx6rz8w7DXl4T2tKjOsYLcqwV1aFWheUMYO9iFbM+HUWVdgmLfS2/QNLwvzy7lpXzsH
 XCR/BZmV1pyqNn8FHqg==
X-Proofpoint-ORIG-GUID: QhqzMjSglRUN6jYg1HOhOzGhyNaH3jqw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2NSBTYWx0ZWRfXzNnk1hiEBpej
 fknkwMQ6ikBSX5S5h76ia/WFIiK+pJfi/5CN9RVFqRnr9aeQ3QI5nsrYOuvNFd/XSqt0DQOxsqN
 NNXEW+m8D8WQlJWui/HfllIU5wBD6kk=
X-Proofpoint-GUID: QhqzMjSglRUN6jYg1HOhOzGhyNaH3jqw
X-Authority-Analysis: v=2.4 cv=HKhWhYtv c=1 sm=1 tr=0 ts=6adf7e07 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=MgpTML6CSb87B1fD_mQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260065

On Sun, 11 Oct 2026 11:52:21 +0200, Oleksii Onchul <oleksiionchul@gmail.com> wrote:
> Add initial device tree support for the Nothing Phone (4a) Pro
> (FroggerPro), based on the Qualcomm Eliza platform.
> 
> Describe the UART, GPIO keys and reserved memory, including ramoops.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
