Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903523;
	b=VqaohY6QOYkArmhlmuUtHUwG0hOM15wi+s1tMSOb3D/PCi2N4mO6GndNSpI+7IFCBRhH
	 5mwX7kMwxngUcgbrvrN/H5y4QBuUJV+JKTmC2H7gXNnrE/RSc+2Yzp3ECdhzaUgafWebH
	 hijskvrsfqZk797tUfVw/GQ6SGMU90Ac8irs/GzZNBc6SK5nVoeM2jTs0vS4eF/L7KrJ9
	 du+jQtFOJgqbM4x6GF42pnirG3BavYfzyHTIqrJCfYR3P0OKqRltIIpGmUgrIL5Af4Gb+
	 BY8qByzhe7wUzEHDthOa8HioLwL3eYr4+l+u1QSph53eSAcRCYxc6NALzs650B6zmtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903523;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iqqBYT2o0voYJAEWiV2QpKz7FUCuNKLcKQcPAzyGKuU=;
	b=fNBRH44K7Wy4+/himFATlNjzqlzwnEVEkABe0VLR+Yngo2h0FM7EDbxn7CNeeo2YNtKU
	 lsbH9DQ7VCD8d47KHzGdaBX+civLiGqwR5DiGtGCMgUzVlxphlAMaTxMfDw5SbYzaqRuh
	 e3bczGAb9RxbDDQqfF+8RuZh0QZLswVLFN9twvR6qTV/WE/RWniZiAthfmH30UrHfy9Ih
	 ShD/U1g45rMZu5bTbJU2P3S75TdDuimWWR6gbe8/flzWvfAokWWAJodReqxT63So+eL75
	 A5Pq0TotqiCS7+QNxluptzM3oNtZtdaz7CsSWvx4QINzFQSq25y1E63bMqa4vJHqlMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UrZv0HG1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iKMz2X4V;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3108606A329
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3108606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UrZv0HG1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iKMz2X4V
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2amNu1801789
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iqqBYT2o0voYJAEWiV2QpKz7FUCuNKLcKQcPAzyGKuU=; b=UrZv0HG1/5tiJl7o
	QYUgONRGH/Ftc1BNXgagMHZZt79S3RXOh1w/gGDO4dMcyhW3POOU9bxRm9FTkSCz
	lbYlivEUItvQuMtZs7XHpbeixpE7aT532Rp4FYiwT5kjhIr6vggPWTlJXZbYQQPn
	gvCSL6gzxWO8Zs1sLHVpoXnNxwvCKKF1CyU3pB/32JwhXY4df38PbDJYP8B4byNH
	LnudeoSo9oWspfsZzZJAke7rEzVeAPzr0qdnPncibo+aB/XSb6hhcomGLKAlADl5
	XoQbY6M7ejT619jnXoWfCwGPzeWEZ0f23WsHjEUYiKdXVVTUF3AlIpR9gFtdgOm9
	jrDWtA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j034y3tub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:18:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f559420f3so466651185a.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 00:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794903521; x=1795508321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iqqBYT2o0voYJAEWiV2QpKz7FUCuNKLcKQcPAzyGKuU=;
        b=iKMz2X4VFJRyYwloOVlwUiRSAG9le+Wu4h0v4sQSfW+YvZ3DcSWv3hg1rOYkV+OrbH
         WRfSdCeLDEgZgIkY+I8+roOW+5uzPbZkBnV+wDaL8gieCmh4bPgOvbaJS61ZqRdMTOvh
         EzLwpstrMGdrtF4Iyh8n56Sw44b8EHa4mYwW8erd0ohCeuP8xUg1sVCvaeSGKpm3VOsR
         F2Ik1dzdHeU/eHKtQobFgYQD3QU282SLVlgfEYMfzaP8OCFWCkl9sXx/1XzNt7Pt2/R+
         KWdyh0E1HRRJtS+FNhJgCwiWaLDxlCz98cJj3kgcznr9IAW3pdNfGljwrmR2JCJbTNze
         ltMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903521; x=1795508321;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iqqBYT2o0voYJAEWiV2QpKz7FUCuNKLcKQcPAzyGKuU=;
        b=d3XVc+/CEpL4zpBEKLI8ONe8imDjU/AoPU1NazFmrLZF0p5Zsh/4J0SWj92DMHiXaY
         uYcvgxtr5KGypW39vD2cTD0KitdM52fTuKP58OVoUXNeP4y+Zh1ddtwaIWS2IVIjdspC
         8vh6LfMe6Naf7IR3suViTyZAZgrC0navyM+UBZVh5AhT0GycP0lEVUD2+EfrrMVm22WP
         R30OMcdk9+DWCegI9tErP9ErzGbeE3aQq2QJj5AxSdOhFupYNY6OeccMYUBbGO2KNEnl
         C+LjpteZcWnJgqe/7WYxpL6vdvjdBDff3opyGp1b++Avot1kHVuSZ75dIaPIIWCiq0tQ
         etQA==
X-Forwarded-Encrypted: i=1; AL+hErETJA0X/NsDK7YgEccoCcMR6rsZ+Hjbl10VdrjNjTN64fzJ6HJkOxvlxq6/0DzrkiwUCXCOj3fjvMTz@vger.kernel.org
X-Gm-Message-State: APuU4Z8HJAsMHvNaKMoBbo1mHKe08NZi81GpIOwlLmWwa+mi689axYzD
	Wav6ByiRjpoSCzMMcycuOMs0eA4ntdrKtyb5tbOrx4C7NWL9EMv6lg6XaVhuHVNJD8x6pNYTtYW
	Vv9Nw/QIX0hUCVl7l19FgPL0Pg+VbCI44DGr76MtdK2ZLkU7dHRuM2ebUiLdq/b1k
X-Gm-Gg: AYBFou1uiEAu7t4nHz7reo6tly4gR99F6EA6P1O0fi2jXJORYdCwKQo5l72EInckDIG
	n2TZr8QDypD9h210Cwq+NHuUqbru4wvJJWMedeSegdFxeWtUN06A3wOlXABPtgjZ5QASW8eyzNY
	SAJSjV88+7un3jVIPC7QdKZZVJOzestbjzoJK6CqugtT0+azSdbk9ZRcsU42nzxANRojyOmv9gc
	X2LHckRmQ67syKUdRHsMp6BCEQ6lvFKoxudU+180jYEC4lUpUvKuIdThhXlwV0Rx/RqgQ0gv9Je
	hsaYO60sm0oK+hVgpREXN92YVEgw3kMZs6Epmb9/6DdvvuCJ3O6DccfNaausVQ6rkpmASA7CNS3
	L+rCLkrYPEP77m7A61B81RZ3XKSC+WVYfIZwG9GaMUqMqZkyf8FaTtKl7OgN6y4cSUVTmpj7jTg
	s=
X-Received: by 2002:a05:620a:a212:b0:949:60f3:1cdc with SMTP id af79cd13be357-94960f31e90mr1296400485a.10.1794903521011;
        Tue, 17 Nov 2026 00:18:41 -0800 (PST)
X-Received: by 2002:a05:620a:a212:b0:949:60f3:1cdc with SMTP id af79cd13be357-94960f31e90mr1296399085a.10.1794903520642;
        Tue, 17 Nov 2026 00:18:40 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78344ddbsm54700015e9.0.2026.11.17.00.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:18:39 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        linux-gpio@vger.kernel.org,
        Joshua Scott <joshua.scott@alliedtelesis.co.nz>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>, Bert Vermeulen <bert@biot.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] gpio: realtek-otto: Add RTL9311B support
Date: Tue, 17 Nov 2026 09:18:37 +0100
Message-ID: <179490351545.13804.18132721202337342128.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109052808.3035449-1-joshua.scott@alliedtelesis.co.nz>
References: <20261109052808.3035449-1-joshua.scott@alliedtelesis.co.nz>
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
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ImG4spDZDkSZCABR9UYgP1HBiw45p5kA
X-Authority-Analysis: v=2.4 cv=aNZlOr9m c=1 sm=1 tr=0 ts=6afc0de2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PLZoExqmlYKt_qTplwoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: ImG4spDZDkSZCABR9UYgP1HBiw45p5kA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzMiBTYWx0ZWRfX0n9CNOfcSKa1
 vAZVQem/45R8xw/SrY2g9Q76q7du+3nGNMqRhlACaFAIA1y2HutfYVWp5WEdAkQATSLrU+7mUkh
 zRSR+IxOCEvfp1U0TyntM27ykODMS8c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzMiBTYWx0ZWRfX+wPQ2gLkVsgM
 BWGqLp0tUXZtu5wtHknjJpIX4XXWDnZtN0f6yHAWNlVYAtDyRCcvccSsok8QWiDs7bx9FIwf5BO
 eWV7qhSyzp4yjILq/v5jVIFlqogd8n7gfO7xw/ccht2GGH2AaQaY2kEGo/NuzBylNm5UdcO1GQB
 xViYtqEV91k9NcwA6Q2Q503Z4DZQ4OomTWZUsA6lCUANNWXVKgXHa1QXh50d9gUbHyrNm6wktuL
 0GiRfezGM57R2GuDT3VGasBXbOu8rFKwZ9k9YSgPb3rKT8vfkPZTNaKDuJ8lnFKW0WVb9pPpSV8
 mesgBzL0vci+2KMrJn9umixKATWV5JJMq1vDDJL2DpyK4IMauWNffgHhAUKkvnQH27QWCymSglc
 sMBelE08cso+WyUhQFzRZpiuhZRZ4JbfwV4fZ4y9bnHBW1D3cYI/haZX+6JFlkZYa0E9hxSo9Hf
 mte6BaL17YdaMF0mUXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170032


On Mon, 09 Nov 2026 18:28:06 +1300, Joshua Scott wrote:
> The Realtek RTL9311B is a network switch with integrated ARMv8 CPU. Its
> GPIO controller is the same as the RTL9310's. This series adds a
> compatible for it, with the RTL9310 compatible as a fallback, and lets
> the driver be built for ARCH_REALTEK.
> 
> The RTL9311B node lists "realtek,rtl9311b-gpio", "realtek,rtl9310-gpio",
> "realtek,otto-gpio". The driver binds through "realtek,rtl9310-gpio",
> which keeps the interrupt controller; "realtek,otto-gpio" alone would
> bind with interrupts disabled.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: gpio: realtek-otto: Add RTL9311B
      https://git.kernel.org/brgl/c/13c7bc6932c08d6c170b4a8108d3faacf7cfff71
[2/2] gpio: realtek-otto: Allow building for the RTL9311B
      https://git.kernel.org/brgl/c/6884633429d1581ecdf1329ff11f8e34a83264ab

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
