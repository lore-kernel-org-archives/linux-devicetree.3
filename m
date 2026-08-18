Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F353AD52F
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 15:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787066935; cv=pass; b=FcevcIPitPG7G0jcswnZw3MH97LV2M+LAw2HIS+PBeXpNJRpfYfSnQDXD5HNMe5NPiKFJjdHlgMcSqMFbJ8Mg3X7TyGNv56qEYw/cGT1ArcDgR2rWWUDE1dE8EpVLUAqXz5ZY89j7NyPZHCOHht0msrnsW4eza9GvqKDc2oNvzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787066935; c=relaxed/simple;
	bh=DTy3+B67pxgfZhDy+SiYueZB7C8wJDeOQgcoeulvcdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rfGTQv2M/6r4dCmkRoDXFvSnV+EMSdPOKGQj2CnzWt4Ohn0Gx136p9ioBIiOxb55pUdWFYc4ATIfDRAWVqvfge7Ms4glBut2/+X2W5VvWEKdyJB2arCiEhZi83a3KWQU1/Q1hxm85F6B5bhNlHIBHNcA7I7Rb0kYXBK+y6r8+og=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aKzMcLlC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NvlOQhBA; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aKzMcLlC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NvlOQhBA"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IE0pkD292940
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 15:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DTy3+B67pxgfZhDy+SiYueZB7C8wJDeOQgcoeulvcdQ=; b=aKzMcLlCdRD7dRxJ
	B7JYiWfZEP9+yGeXaZk323F8L1UVnfiLafDcCfjQgsTZBQ4981CSJQTUnVssJk2Y
	7MEKkICz30NzNAs24HzSo1ZcJznyER5ugj4hxt2TwbS3MpmPeWKdPurmijus9I+J
	jVd8eWyaKuEL3K402BkLN5d199PbTKFUYvUWRh/0y9awq31xM24aWslBJTw1rkUi
	yFNn2jLtbpD+HDwFYmXKvP1Mwx3ttH97cEpLRfdGaRUyp1iVGWbidUFsd0H6dJYK
	QcJgLF0EllOoFbDCc60r+5ZtXS82y9dtdWhFZ8Eo+XropBizXMA935mrq0JlwDqh
	o3qKTg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4resghhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 15:28:52 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81e71be771cso29987877b3.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:28:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787066932; cv=none;
        d=google.com; s=arc-20260327;
        b=S5ZQuESSJQBwXYCg/gnXTS6O3vVvfNS2cL2R0o7/jlXNpeIyebpkOvHp15+XSzT/S7
         w7AudfD3LxWwx1Nw37Y8VGwLep1AIdE63BjhYduQPAcZwqTJ5fY5tEJEqGrD0Sq+dB5X
         ZOjqRROExgCRYm3/0bm0U4+NT27Oc28hw0f8cCHCcShRFJUj7pc2Wir2i2MkKgF525y/
         upMmkEbX/NWAuvXdK+iiOTHzM+w461XUwNKCSAKEVeehz7eHPDK8dvF0PrE+uze5sqZx
         I1brk6o7hejLWV5kJVQJvKtLEk0dNYrjd1IkjQE+ZRfuj4glN1TxTr+JuTkvKFwStgim
         heOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DTy3+B67pxgfZhDy+SiYueZB7C8wJDeOQgcoeulvcdQ=;
        fh=Uz7gZkSkqaafUeCfBZq0M6r7gxtkuiRIrfBUgrOnSvE=;
        b=H/Yi+ZkzA9XdU2eLVoA/jOyFUgIpiVr31H5/PvjCOgXnBmZHzgvEuEtBc5wP/wJe8y
         HcLMBC+1deQ1GYciY13JkVFpjIfWQxl+r6T3TqgRbUToeg3jQHmzbXcUUihOCMmTBKs1
         BnOXt99sDlVYEaweNPlH/k7mccPzSlYfFAA3t2KJQrqpm8UaBdWMybLkUILyG2h5GvMh
         0+ZfeUHF2DLmKxrJ01mY1dnwvQWGUp2pIt/dsO/n6g4mn4PC+DcZeobRcRncsW/U5zGv
         cXTHBZKdhH/iy95GXfhxsXwv+25L/i2EI8SaMSfi6UQYl7RfSg/ivO4ZDLp0rptli5BF
         UdGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787066932; x=1787671732; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DTy3+B67pxgfZhDy+SiYueZB7C8wJDeOQgcoeulvcdQ=;
        b=NvlOQhBAe8m6cQmQDXoedgRJrLuVAmjY/v6hb0nRTZVF+7R7RSQuvbKgX3Hj2g+Ubm
         DdAMO7O1NJqP2xdEvhFNm6QKQ8u+MCKqZYf7iVRRpOy1ZnYKgKpqplicrLTJn9QvKFjL
         wUxWwaIA2+ZG4fCj9JjcMJJfm7axkHohOrSZ4Hquk/BywxFUrQVEzwPafIrgyKFfeNkC
         O3B8ElxQ3P9FypBpAo0wGSTAYma56BDgfQmugb2NeCoMCoYUgjrOY3nuFdiINNbtw/ya
         qmBJjAPYc/i4bLnRoCXj1bJWPNmz+VDOQF6huCfXEdzYfWjCB8eQJgXw7DJmQDSp+E6T
         XJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787066932; x=1787671732;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DTy3+B67pxgfZhDy+SiYueZB7C8wJDeOQgcoeulvcdQ=;
        b=aGwF2qQtFyyRTuPO+QcIJT524Ds0mGFVJm8/5FD0C5In02TTAqaE2FAUkH+Fn5LSc4
         Fbr2kof/gsj5vpDg3aNqdLw3nwfIA9oiR+LrkxIm9ZJQ103P9TVpN5lrrtks7SotghNB
         KID7QSY3Xy9d/gdmy7eil8xAIMvr7uk9LUaaKo3AWCWuoojkFTL2FkBv3Ua+zXassnI+
         G+F0GXslhjL3l3MqtH+tDsnYD1SZOxSr6KywFE4T+GvA3sT9b7Jhw/He9AzmoMwvJEJ8
         j7Td59gRM89M/wlWJM2yOzzPvbpwJ7KVAiruO+skbKJ8GXC1YBNLX70W3lPjhq5W+LHu
         orvA==
X-Forwarded-Encrypted: i=1; AHgh+RqhfPyVRzlfpD11I/Gv8H7gyCQKQOIJOvv9hSxQvifyHPGTIvwDIZnUOBsv6BWYIVWrnYci+5knRQMY@vger.kernel.org
X-Gm-Message-State: AOJu0YwFFBd8NibNwB/yIl4wh6QsNJ0Z8TT60Op8q5GzzVRaUrCktDiz
	5aRjnRmHoKXkOEODTic+K01xpBhjIqsPxkkDomZ7T4gD/u8wVglHVeErlmAZyHZdoOM3fXQWhoa
	0Q6z4uLtXp3skOCpg1y4ctw1pNzvR4mmCI3EEvlU+q+//EzEXc3FNqvZDOPwDvp92EHsdKmrG6W
	ddZEzwdP3U65pItg94Nv/1rCylVpcc7xj39i4xFeY=
X-Gm-Gg: AR+sD10Gwa9DCUSE2/2iWmZHyOlTRCfU476NFqinXfaAXNjuZ+9d69+zOUzRowrTWMW
	8V9ZhnKUfcjl9H8RogFOBGGLDqsJZiqcaibrmAtJZITXpeyEjN1ccBwByaQlTAWvuhMegZQIEXT
	hvQ52d66ekyeyQzfSw6v3Rs9QDJX8GO1mmSjLzSr0l7/WEPJIM7oIcig==
X-Received: by 2002:a05:690e:155a:20b0:666:c4c5:7525 with SMTP id 956f58d0204a3-66cbc3d8adamr2153905d50.24.1787066932158;
        Tue, 18 Aug 2026 08:28:52 -0700 (PDT)
X-Received: by 2002:a05:690e:155a:20b0:666:c4c5:7525 with SMTP id
 956f58d0204a3-66cbc3d8adamr2153876d50.24.1787066931719; Tue, 18 Aug 2026
 08:28:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260814152610.2039318-1-milosz.wasilewski@oss.qualcomm.com> <2deee675-e82b-4822-a43d-4264ca8cd512@oss.qualcomm.com>
In-Reply-To: <2deee675-e82b-4822-a43d-4264ca8cd512@oss.qualcomm.com>
From: Milosz Wasilewski <milosz.wasilewski@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:28:41 -0400
X-Gm-Features: AcwNN1Vn7wdwA-Y_UWlqdj-gRIvhsjaNGKlX7k8kMwe3TvS3UDX7acOhRTSki68
Message-ID: <CAEGFhMpTrgmUYfLSKCAvNRXgawbppuHnJ+PMeMx5M4jzm9_tKw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: monaco: add PMIC PON with power key
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Ne/WEWD4 c=1 sm=1 tr=0 ts=6a847a34 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=uUlyFbyf3nrlIwLYtmQA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: w-x4CnzOifQZdyTF3yGy1tvfzPskb72w
X-Proofpoint-ORIG-GUID: w-x4CnzOifQZdyTF3yGy1tvfzPskb72w
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDExNCBTYWx0ZWRfX9hGdKDrgKuvo
 pr8ZRSn7VL23Fgu1Yat10cMq3yRsh3U0Fkz60+6xQtSj4w4euGsH1yzyzkzyTwwKLenNLQTHVai
 I3gv+N1C8taqclEslONDirVkUfy6rng=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDExNCBTYWx0ZWRfX6/e7KBHAekzH
 pbzgOYLCUrFKBtJ/wCDDBSkWhEuPYX2+e4MAMu8kvKQMe0+tQsVBqkJd+VadlKKs/BcIjvyQ1Mv
 +84B64DTdsk/jr5QQgge9MI9lZFsDQZgem2eb5Pd3Fbkh3fkxnjk6WsTLVDvLAYuDm30gzxEh9V
 AWm0efV34xivt0eWNfTlobkei6PzUjoYfe5N1ZgcqqAKbyYlRAza/6GVhnhD5z+o5vE1dhHgwTX
 K/1i/nqCuHYgim/DpuSuVPfM82HC19T132P+g1nCFIpDD8nBG1OqBztk7Qcv2luf9KVn+AJ9qkw
 zSutr1f2MGfjrL+LlrLu3QtwKCKWktUDycnWjfNKZDEnf0BWXLqK7guR4vuqGwa9KRoQPsnFX2J
 eoGxSuRv+rFdmz8pE2pueaKOb9KVlLcb4k6/lUQ1t7JWwoKTCvmGRJWUO7an/5v4rWtC/+hWpMz
 wwC6jA3DLP3GMLNSCwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180114

On Tue, Aug 18, 2026 at 9:02=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
>
> There's a parallel effort:
>
> https://lore.kernel.org/linux-arm-msm/20260724-b4-add_pwrkey_and_resin-v6=
-0-41acc214d93a@oss.qualcomm.com/
>

Thanks for pointing this out. I tested it and it works.

Best Regards,
Milosz
