Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561833D9666
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 11:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782388291; cv=none; b=gRuo7/c29fFFehASvzTCKFGwmZ5VZmdNqZWdPpzGA77Kzh4wTENa3phjFxu4y6b0nH4gGYqHVEk2xjfmGmWmnIOLXpdz+Joeau+N082oqW71TRHtPhMbQWRn0aL3mX7cSVG3+44ECUAGTcjqFv+06qBoxFea+fJsfjAnkSF5BY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782388291; c=relaxed/simple;
	bh=9hdZBNNto4XcSJBeJJ3ffJwjIQj5iArOXWtVnbRntZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K4FyfojfyIfGi+0ztDTP2JA6vVVhirJeqcctuy0KBDUQ4oa/Hq60nXhQLYFq44Fz/i5J+E0otLzUL5xXdzTtkPiKdSFDnBdVCQLjAlQtqeDzXLea/GlXgn8PZXMkUd0YW7fPaGTcTr6LfUYuxNY02YdP3bm2v/4chyd00dE8MbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OJe6ZZpx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VssbVeUc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OJe6ZZpx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VssbVeUc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9jsk81454344
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 11:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sd7H9S7CirR3Vc3A8w6/dAsNp5ch3wbXoeVztDkNaSo=; b=OJe6ZZpxWL2d/8e0
	G6CXLM65/zRgC/c2MbXwUuMK3hvOnNm49dYzhaE23hKVV7ONq4Qj4XXroP0pr7lg
	rtuxMRoxmtAh6zI30V+M9AKonxcSSEoQ3r98Sug115O6KYl/oxKzEckTtPNxQT1W
	I7Nx7M0Eye47Vicle4NjGbVjTInPeEJyVts0cdgaiRmgnpctYbC7oTViqdl2WX0d
	KlxFrNrXI7aoPqfo3V9N8ZPbemQSFN7DTjBuMs3AOIEBj2FRvckF8gIIUPcl6Zl+
	cfGbsgIVxgpox5TJS9n29SijrouOq8hejZCEGaYJ8gJVlbToiDYvYz/sJ6A/MqJa
	++KkCA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0mjbufmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 11:51:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915732517cdso11995685a.2
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 04:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782388288; x=1782993088; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sd7H9S7CirR3Vc3A8w6/dAsNp5ch3wbXoeVztDkNaSo=;
        b=VssbVeUc3vo7wkRft94G/9uYBpkvxeVlyNLbhXqj2eOZ7cEZpUtR/2XtQ7WwQIugi6
         gW5sbUZMG8lk4r83mTCgyt3rGKyJC614BKx5qhzAR6L6OLGsnq/khFnl2zWmOlOpH6iO
         f2QcJWVTM1gBG/GUj9yWfvh7PqbwExDwj8PSB/14oqkens3Kh7YMfEhPjihba+55eGBo
         yA1aleX8gWteEl4bpfSuTX45twTeilHilp7uGI8C3vcaglTg7MJfPCADzzW75RaE9zMm
         dd5Oq8NFzsYvpkakxpL1FwFh8UV7HLrV1hTfkzGbpo5WW7FXPbKmzYvSjY5QCxCOFLgm
         rz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782388288; x=1782993088;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sd7H9S7CirR3Vc3A8w6/dAsNp5ch3wbXoeVztDkNaSo=;
        b=fEKlCfB7FwfrbhXbS6gQWJ8WfO56NGzqvex/0ggYfmZXwvAt41JDnCA1bVx+sWsFnZ
         qGBnPDjhQscGoIR4u1xPovSKCWI6RYW9dC5d7pBFDCunr7+Z17P7iQzstof9rSZWIbFD
         cluUGWHb4oRskSkVCwHp3aZb+Q94O0ZNRo0GAEHQw+QgBsQq7IfXFyReVy4f6KQPk3Qs
         tC9ZNIJKjiYIXx2jWcM0QmBbJZlP+FE+6BZUbQ+aL+usELF36nttFPQGYgAldyB7pf77
         3ZH/QQ7tiPGzgwIARkWRbrjC6scPnWYgRUa3B5vVNLvi3dBvF1N3bPnS0aK5lND8Vzcj
         3M6g==
X-Forwarded-Encrypted: i=1; AFNElJ+/L0cscdt+TegcURrhFSK7zO4puAwjuQ6p/uBUCmL1lDkX/Z1avKfmkOLtYjf5rilwlh+6UQde7w6a@vger.kernel.org
X-Gm-Message-State: AOJu0YzgLUR1RtrIkQMZS2ikFbAwkwPPw2Jxll61V2W+zALYufGHDEd+
	szjIiw9PUyLX5UCjzJPlPcEmLxYHok+VouF1vZF84PrZuCPCSazYdKbzUbQEKejvz26yOp/p/PW
	4vcuB41cdf9jojeXbSeedCpWXXvNPWIXOhEX6frW/S6ZdMzjUqPaobgsH1JJYVOxh
X-Gm-Gg: AfdE7cngljebc9rH1h3jrxgHnctPWHvD+BwAvoaYmSmUQOq5yNhZ9RJayYYZ7Sbf+yx
	712HNR4cT4H/SusI3V/s1EV2Lp0JU6VwGCs5PTTNKwotZVmCnI1Wjl+qYMOne87u7++MNBGFQJS
	dN25HT7hakRyr9zAPxL2goyQlqTFE7mgA81d3ikfuk1zsqR7qCNyzFbFNDJQnhQlHkgfdPaBRfk
	n5N6fh7AA/HQeNrh+4fH4GtZH/D5uT9NqNrMcV6I+yQ6YP58i29slvxvz3DXoobJUH9hcPYpBcm
	Bm4mNaIhx2ld4wk4lxLr6jeXN9VJjw7vt/gQOUAJ+Uar3+yWMEW5p8ESP/LsKDzQBtbZrB1aAH/
	VHWKQsrjdu6VTQkg7lm+76Bn/CkNymJY79Gk=
X-Received: by 2002:a05:620a:800e:b0:8ee:e440:fae2 with SMTP id af79cd13be357-9293ddac485mr181341185a.5.1782388288676;
        Thu, 25 Jun 2026 04:51:28 -0700 (PDT)
X-Received: by 2002:a05:620a:800e:b0:8ee:e440:fae2 with SMTP id af79cd13be357-9293ddac485mr181337385a.5.1782388288048;
        Thu, 25 Jun 2026 04:51:28 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbba88b3sm169575966b.12.2026.06.25.04.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 04:51:27 -0700 (PDT)
Message-ID: <e628c11f-9e11-4082-937e-0c6e8455f244@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 13:51:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] usb: misc: qcom_eud: add sysfs attribute for port
 selection
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <20260501170635.2641748-3-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260501170635.2641748-3-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwMSBTYWx0ZWRfXysb+REIVRJL3
 NpagK2o19jgZkAoTQeTBikl/IyDQFI9zTocWgZAJ7+OS6S+oYpdCxt3aCQNs6rQLEXpC4d44hIj
 8Wpn9tp45QUQcIWfdVGkq/WZKCVjxT8=
X-Proofpoint-ORIG-GUID: d32Y8Z2ruzUn9BR6vNHMk2Yuonu3bV52
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwMSBTYWx0ZWRfX18XhBnGrsgPL
 S2n0IpS1wljCoepisoCzXa3LTvLysu0TiCpbLqgXwfz2+bjl/DaZSYVa6Dv4YOVtqKmhn18lRWh
 oLj4CSx/K2EhcnGq18O5rgtiTKQupqKGZPrHQtIMFSFiQ8Or6uybADNYKtH4hf4F1W1Z/YXcRoH
 wWyPuH2KXgN2uQ0qni/+xGmuR7yDTmxADZ/5abICE3z20t3Ql+RV5NZ50fwMelLx5qJjLPyeAQa
 LAYdyoTTA8VVX8bSwwDMtBA0oxYQ7Ex2mslsvZV04VU+xIOymarKdNmiGlXpyoiqozHjtSgxRIm
 QQSZJ6No/I5cHrDSjxuf8iob1czxBFHLeJlSpi14WAwdKMazeozBrYtKz+vNEvbnBPpdvnFbspd
 PmOMggW1N3Jono5tWNabgK1F6wrXvt1iiqV2zXWaplTgurXNsa+1BKZTt31wgOeEMfN+suS5h33
 DXKN0irqF6ax1n44Wng==
X-Proofpoint-GUID: d32Y8Z2ruzUn9BR6vNHMk2Yuonu3bV52
X-Authority-Analysis: v=2.4 cv=TcSmcxQh c=1 sm=1 tr=0 ts=6a3d1641 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Mi7szx8wPLqchxB2UhAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250101

On 5/1/26 7:06 PM, Elson Serrao wrote:
> EUD can be mapped to either the primary USB port or the secondary USB port
> depending on the value of the EUD_PORT_SEL register. Add a 'port' sysfs
> attribute to allow userspace to select which port EUD should operate on
> and update the ABI documentation. This is needed for systems with dual
> USB ports where EUD needs to be accessible on either port depending on the
> system configuration and use case.
> 
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
